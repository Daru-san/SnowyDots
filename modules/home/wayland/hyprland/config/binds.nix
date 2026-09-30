{
  config,
  pkgs,
  system,
  inputs,
  lib,
  osConfig,
  ...
}:
let
  inherit (lib) getExe getExe';
  mkLua = lib.generators.mkLuaInline;
  toLua = args: lib.generators.toLua { } args;
in
{
  wayland.windowManager.hyprland.settings =
    let
      mkBind = mods: key: action: desc: {
        _args = [
          "${mods}+${key}"
          (mkLua action)
          (mkLua (toLua {
            descption = desc;
          }))
        ];
      };

      mkBindWith = mods: key: action: args: desc: {
        _args = [
          "${mods}+${key}"
          (mkLua action)
          (mkLua (toLua (args // { descption = desc; })))
        ];
      };

      mkBindExe = mods: key: action: desc: {
        _args = [
          "${mods}+${key}"
          (mkLua "hl.dsp.exec_cmd(\"${action}\")")
          (mkLua (toLua {
            descption = desc;
          }))
        ];
      };

      mkBindExeWith = mods: key: action: args: desc: {
        _args = [
          "${mods}+${key}"
          (mkLua "hl.dsp.exec_cmd(\"${action}\")")
          (mkLua (toLua (args // { descption = desc; })))
        ];
      };

      mkBindSingleWith = key: action: args: desc: {
        _args = [
          key
          (mkLua "hl.dsp.exec_raw(\"${action}\")")
          (mkLua (toLua (args // { descption = desc; })))
        ];
      };

      mkBindExeProp = args: mods: key: action: desc: {
        _args = [
          "${mods}+${key}"
          (mkLua "hl.dsp.exec_cmd(\"${action}\", ${toLua args})")
          (mkLua (toLua {
            descption = desc;
          }))
        ];
      };

      mkBindSend = mods: key: prog: orig-mod: orig-key: desc: {
        _args = [
          "${mods}+${key}"
          (mkLua "hl.dsp.send_shortcut(${
            toLua {
              inherit mods key;
              window = "class:${prog}";
            }
          })")
        ];
      };
    in
    {
      bind = lib.flatten [
        (
          let
            file-manager = getExe pkgs.nautilus;
            yazi = getExe config.programs.yazi.package;
            hyprlock = getExe config.programs.hyprlock.package;
            btop = "${osConfig.security.wrapperDir}/btop";
            terminal = getExe config.programs.foot.package;
            obs = "^(com\.obsproject\.Studio)$";
            copyq = getExe pkgs.copyq;
          in
          [
            (mkBindExeProp { workspace = 4; } "SUPER" "e" file-manager "Launch file manager")
            (mkBindExe "SUPER+SHIFT" "v" "${copyq} toggle" "Launch copyq clipboard manager")

            (mkBindExe "SUPER" "q" terminal "Launch a terminal")
            (mkBindExe "SUPER" "r" "${terminal} -e ${yazi}" "Launch yazi")
            (mkBindExe "SUPER" "m" "${terminal} -e ${btop}" "Launch a system monitor")

            (mkBind "SUPER+SHIFT" "e" "hl.dsp.exit()" "Exit hyprland session")

            (mkBind "SUPER+SHIFT" "q" "hl.dsp.window.kill()" "Kill active window")
            (mkBind "SUPER" "f" "hl.dsp.window.fullscreen()" "Toggle fullscreen")
            (mkBind "SUPER" "v" "hl.dsp.window.float()" "Toggle floating")

            (mkBind "SUPER" "page_up" "hl.dsp.focus(${toLua { workspace = "e-1"; }})"
              "Focus the previous workspace"
            )
            (mkBind "SUPER+SHIFT" "page_up" "hl.dsp.window.move(${toLua { workspace = "e-1"; }})"
              "Move window to previous workspace"
            )
            (mkBind "SUPER" "page_down" "hl.dsp.focus(${toLua { workspace = "r+1"; }})"
              "Focus the next workspace"
            )
            (mkBind "SUPER+SHIFT" "page_down" "hl.dsp.focus(${toLua { workspace = "r-1"; }})"
              "Move window to the next workspace"
            )

            (mkBind "SUPER" "mouse_down" "hl.dsp.focus(${toLua { workspace = "e-1"; }})"
              "Scroll to the previous workspace"
            )
            (mkBind "SUPER" "mouse_up" "hl.dsp.focus(${toLua { workspace = "e+1"; }})"
              "Scroll to the next workspace"
            )

            (mkBindWith "SUPER" "mouse:272" "hl.dsp.window.drag()" { mouse = true; } "Drag window")
            (mkBindWith "SUPER" "mouse:273" "hl.dsp.window.resize()" { mouse = true; } "Resize window")

            (mkBindExe "SUPER+SHIFT" "x" "hyprctl reload" "Reload hyprland")

            (mkBindExe "SUPER+ALT" "l" "${hyprlock} --immediate" "Lock the screen")

            # OBS Studio global keybindings
            (mkBindSend "SHIFT" "f3" obs "SHIFT" "m" "Mute desktop audio")
            (mkBindSend "SHIFT" "f4" obs "SHIFT" "n" "Mute microphone audio")
            (mkBindSend "SHIFT" "f5" obs "SHIFT" "c" "Split recording file")
            (mkBindSend "SHIFT" "f6" obs "SHIFT" "r" "Start recording")
            (mkBindSend "SHIFT" "f7" obs "SHIFT" "t" "Toggle recording (pause/unpause)")
            (mkBindSend "SHIFT" "f8" obs "SHIFT" "s" "Stop recording")
          ]
        )
        (
          let
            inherit (lib) range mapAttrsToList imap0;
            workspaces = map toString (range 0 9);
            workspaces-numpad = [
              "KP_Insert"
              "KP_End"
              "KP_Down"
              "KP_Next"
              "KP_Left"
              "KP_Begin"
              "KP_Right"
              "KP_Home"
              "KP_Up"
              "KP_Prior"
            ];
            directions = rec {
              left = "\"l\"";
              right = "\"r\"";
              up = "\"u\"";
              down = "\"d\"";
              h = left;
              l = right;
              k = up;
              j = down;
            };
            focusWorkspace =
              id:
              "hl.dsp.focus(${
                toLua {
                  workspace = id;
                }
              })";
          in
          [

            # Change workspace
            (map (n: mkBind "SUPER" n (focusWorkspace n) "Focus workspace ${n}") workspaces)

            (imap0 (
              n: key: mkBind "SUPER" key (focusWorkspace (toString n)) "Focus workspace ${toString n}"
            ) workspaces-numpad)

            # Move window to workspace
            (map (
              n:
              mkBind "SUPER+SHIFT" n "hl.plugin.hy3.move_to_workspace(${n}, ${toLua { follow = true; }})"
                "Move window to workspace ${n}"
            ) workspaces)

            (imap0 (
              n: key:
              mkBind "SUPER+SHIFT" key
                "hl.plugin.hy3.move_to_workspace(${toString n}, ${toLua { follow = true; }})"
                "Move window to workspace ${toString n}"
            ) workspaces)

            # Move focus
            (mapAttrsToList (
              key: direction:
              mkBind "SUPER" key "hl.plugin.hy3.move_focus(${direction}, ${toLua { warp = true; }})"
                "Move focus to ${direction}"
            ) directions)

            # Move windows
            (mapAttrsToList (
              key: direction:
              mkBind "SUPER+SHIFT" key "hl.plugin.hy3.move_window(${direction}, ${
                toLua {
                  once = true;
                  visible = true;
                }
              })" "Move active window to ${direction}"
            ) directions)

            # (mapAttrsToList (key: direction: "ALT+SHIFT, ${key}, hy3.focus_tab, ${direction}") directions)
            # # Move windows
            # (mapAttrsToList (key: direction: "SUPER+CONTROL,${key},movewindoworgroup,${direction}") directions)
            # # Move monitor focus
            # (mapAttrsToList (key: direction: "SUPER+ALT,${key},focusmonitor,${direction}") directions)
            # # Move workspace to other monitor
            # (mapAttrsToList (
            #   key: direction: "SUPER+ALT+SHIFT,${key},movecurrentworkspacetomonitor,${direction}"
            # ) directions)
          ]
        )
        (
          let
            mkBindSingle =
              key: action: desc:
              mkBindSingleWith key action {
                locked = true;
                repeating = true;
              } desc;
            mkBindExe =
              mods: key: action: desc:
              mkBindExeWith mods key action {
                locked = true;
                repeating = true;
              } desc;

            wpctl = getExe' pkgs.wireplumber "wpctl";
            mute = "${wpctl} set-mute @DEFAULT_SINK@ toggle";
            raise-volume = "${wpctl} set-volume @DEFAULT_SINK@ 0.05+";
            lower-volume = "${wpctl} set-volume @DEFAULT_SINK@ 0.05-";
            brightnessctl = getExe pkgs.brightnessctl;
            raise-brightness = "${brightnessctl} set +5%";
            lower-brightness = "${brightnessctl} set 5%-";

            flameshot = getExe config.services.flameshot.package;

            playerctl = getExe config.services.playerctld.package;
            player-next = "${playerctl} next";
            player-prex = "${playerctl} previous";
            player-toggle = "${playerctl} play-pause";
            player-stop = "${playerctl} stop";
          in
          [
            (mkBindSingle "XF86AudioRaiseVolume" raise-volume "Raise volume")
            (mkBindSingle "XF86AudioLowerVolume" lower-volume "Lower volume")
            (mkBindSingle "XF86AudioMute" mute "Mute audio")
            (mkBindSingle "XF86MonBrightnessUp" raise-brightness "Raise brightness")
            (mkBindSingle "XF86MonBrightnessDown" lower-brightness "Lower brightness")

            (mkBindExe "SUPER" "f12" "systemctl suspend" "Suspend system")

            # Screenshotting
            (mkBindSingle "print" "${flameshot} gui" "Take a screenshot of a selected region")
            (mkBindExe "SHIFT" "print" "${flameshot} screen" "Take a screenshot of the whole screen")

            # Music players
            (mkBindSingle "XF86AudioNext" player-next "Move to next track")
            (mkBindSingle "XF86AudioPrev" player-prex "Move to previous track")
            (mkBindSingle "XF86AudioPlay" player-toggle "Pause-play current track")
            (mkBindSingle "XF86AudioStop" player-stop "Stop current track")

            (mkBindExe "SHIFT" "F12" player-next "Move to next track")
            (mkBindExe "SHIFT" "F9" player-prex "Move to previous track")
            (mkBindExe "SHIFT" "F10" player-toggle "Pause-play current track")
            (mkBindExe "SHIFT" "F11" player-stop "Stop current track")
          ]
        )

        (
          let
            easyeffects = getExe config.services.easyeffects.package;
            fuzzel = getExe config.programs.fuzzel.package;
            pk = getExe' pkgs.busybox "pkill";
            wleave = getExe config.programs.wleave.package;

            iwgtk = getExe pkgs.iwgtk;

            overskride = getExe pkgs.overskride;

            mkBindExe =
              mods: key: action: desc:
              mkBindExeWith mods key action {
                release = true;
              } desc;
          in
          [
            (mkBindExe "SUPER" "d" "${pk} anyrun || ${fuzzel}" "Launch app launcher")

            (mkBindExe "SUPER" "i" "${pk} iwgtk || ${iwgtk}" "Launch the iwgtk wifi menu")

            (mkBindExe "SUPER" "a" "hyprctl clients | grep 'easyeffects' || ${easyeffects}"
              "Launch easyeffects audio mixer"
            )

            (mkBindExe "SUPER" "x" "${pk} wleave || ${wleave}" "Launch the wleave logout menu")

            # Bluetooth manager
            (mkBindExe "SUPER+SHIFT" "i" "${pk} overskride || ${overskride}"
              "Open the Overskride bluetooth manager"
            )
          ]
        )
      ];
    };
}
