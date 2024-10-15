{
  config,
  pkgs,
  system,
  inputs,
  lib,
  ...
}:
let
  inherit (lib) getExe getExe';
  inherit (pkgs) writeShellScriptBin;
  idle-inhibit =
    let
      vigiland = getExe (
        inputs.vigiland.packages.${pkgs.system}.default.overrideAttrs {
          meta.mainProgram = "vigiland";
        }
      );
    in
    getExe (
      writeShellScriptBin "idle-inhibit" ''
        inhibited=off
        if pgrep 'vigiland'; then
          ${pkgs.killall}/bin/killall vigiland
          inhibited=off
        else
          ${vigiland} &
          inhibited=on
        fi
        hyprctl notify -1 6000 0 "Idle inhibiting is now ''${inhibited}"
      ''
    );
in
{
  imports = [ ./extra-binds.nix ];
  wayland.windowManager.hyprland.settings =
    let
      e = "exec";
      # Normal (hyprland) binds
      mkBind =
        mods: key: action: desc:
        "${mods},${key},${desc},${action}";
      # Binds that execute programs
      mkBindE =
        mods: key: action: desc:
        "${mods},${key},${desc},${e},${action}";
      # Binds with singular keys
      mkBindSE =
        key: action: desc:
        ",${key},${desc},${e},${action}";
    in
    {
      bindd =
        let
          terminal = getExe config.programs.kitty.package;
          browser = getExe config.programs.firefox.package;
          file-manager = getExe pkgs.nautilus;
          editor = "nvim";
          yazi = getExe config.programs.yazi.package;
          hyprlock = getExe config.programs.hyprlock.package;
          btop = getExe config.programs.btop.package;
          copyq = getExe pkgs.copyq;
          swayosd = getExe' config.services.swayosd.package "swayosd-client";
          g4music = getExe pkgs.g4music;
          valent = getExe pkgs.valent;
          obs = getExe pkgs.obs-cmd;
          syncthingtray = getExe (
            pkgs.syncthingtray.overrideAttrs {
              meta.mainProgram = "syncthingtray";
            }
          );
        in
        [
          (mkBindE "super" "e" "hyprctl clients | grep 'nautilus' || ${file-manager}" "Launch file manager")
          (mkBindE "super" "b" browser "Launch the browser")
          (mkBindE "altshift" "m" g4music "Open a music player")
          (mkBindE "Super" "n" valent "Launch valent")

          (mkBindE "super" "q" terminal "Launch a terminal")
          (mkBindE "super" "r" "${terminal} --detach ${yazi}" "Launch yazi")
          (mkBindE "super" "z" "${terminal} --detach ${editor}" "Launch a text editor")
          (mkBindE "super" "m" "${terminal} --detach ${btop}" "Launch a system monitor")

          (mkBindE "supershift" "v" "${copyq} menu" "Launch the clipboard menu")

          (mkBind "supershift" "q" "killactive" "Kill active window")
          (mkBind "supershift" "e" "exit" "Exit hyprland session")
          (mkBind "super" "s" "togglesplit" "Toggle split layout")
          (mkBind "super" "f" "fullscreen" "Toggle fullscreen")
          (mkBind "super" "v" "togglefloating" "Toggle floating")
          (mkBindE "supershift" "x" "hyprctl reload" "Reload hyprland")

          (mkBindE "supershift" "l" "${hyprlock} --immediate" "Lock the screen")

          (mkBindSE "caps_lock" "${swayosd} --caps-lock" "Show caps lock")

          (mkBindE "super" "grave" idle-inhibit "Turn on the idle inhibitor")

          (mkBindE "super" "F2" "${obs} recording start" "Start recording")
          (mkBindE "super" "F3" "${obs} recording stop" "Stop recording")
          (mkBindE "super" "F4" "${obs} recording toggle" "Toggle recording(start/stop)")

          (mkBindE "supershift" "m" "${syncthingtray} -w" "Open syncthing tray")
        ];

      binddle =
        let
          s = getExe' config.services.swayosd.package "swayosd-client";
          mute = "${s} --output-volume mute-toggle";
          raise-volume = "${s} --output-volume raise";
          lower-volume = "${s} --output-volume lower";
          raise-brightness = "${s} --brightness raise";
          lower-brightness = "${s} --brightness lower";
        in
        [
          (mkBindSE "XF86MonBrightnessUp" raise-brightness "Raise brightness")
          (mkBindSE "XF86MonBrightnessDown" lower-brightness "Lower brightness")

          (mkBindSE "XF86AudioRaiseVolume" raise-volume "Raise volume")
          (mkBindSE "XF86AudioLowerVolume" lower-volume "Lower volume")
          (mkBindSE "XF86AudioMute" mute "Mute audio")

          (mkBindE "shift" "F8" raise-volume "Raise volume")
          (mkBindE "shift" "F6" lower-volume "Lower volume")
          (mkBindE "shift" "F7" mute "Mute audio")
        ];

      binddl =
        let
          p = getExe config.services.playerctld.package;
          next = "${p} next";
          prev = "${p} previous";
          toggle-play = "${p} play-pause";
          stop = "${p} stop";
        in
        [
          (mkBindSE "XF86AudioNext" next "Move to next track")
          (mkBindSE "XF86AudioPrev" prev "Move to previous track")
          (mkBindSE "XF86AudioPlay" toggle-play "Pause-play current track")
          (mkBindSE "XF86AudioStop" stop "Stop current track")

          (mkBindE "shift" "F12" next "Move to next track")
          (mkBindE "shift" "F9" prev "Move to previous track")
          (mkBindE "shift" "F10" toggle-play "Pause-play current track")
          (mkBindE "shift" "F11" stop "Stop current track")
        ];

      binddr =
        let
          anyrun = getExe config.programs.anyrun.package;
          easyeffects = getExe config.services.easyeffects.package;
          color-picker = getExe inputs.color-picker.packages.${system}.default;
          wlogout = getExe config.programs.wlogout.package;
          pk = getExe' pkgs.busybox "pkill";

          iwgtk = getExe pkgs.iwgtk;

          # Screenshots
          hyprshot = getExe pkgs.hyprshot;

          kitty = getExe pkgs.kitty;
        in
        [
          (mkBindE "super" "d" "${pk} anyrun || ${anyrun}" "Launch app launcher")

          (mkBindE "super" "i" "${pk} iwgtk || ${iwgtk}" "Launch the iwgtk wifi menu")

          (mkBindE "super" "a" "hyprctl clients | grep 'easyeffects' || ${easyeffects}"
            "Launch easyeffects audio mixer"
          )

          # Color picker
          (mkBindE "supershift" "c" "${pk} color-picker || ${color-picker}" "Launch the color picker")

          # wlogout
          (mkBindE "super" "x" "${pk} wlogout || ${wlogout}" "Show login menu")

          # Audio mixer
          (mkBindE "super" "p" "${pk} pulsemixer || ${kitty} --class pulsemixer --detach pulsemixer"
            "Launch pulsemixer"
          )

          # Screenshotting
          (mkBindSE "print" "${pk} hyprshot || ${hyprshot} -m region -z -o ~/Pictures/Screenshots"
            "Take a screenshot of a selected region"
          )
          (mkBindE "alt" "print" "${pk} hyprshot || ${hyprshot} -m active -z -o ~/Pictures/Screenshots"
            "Take a screenshot of the entire screen"
          )
        ];
    };
}
