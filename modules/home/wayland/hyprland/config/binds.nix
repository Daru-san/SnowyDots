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
      mkBind =
        mods: key: action: desc:
        "${mods},${key},${desc},${action}";

      mkBindExe =
        mods: key: action: desc:
        "${mods},${key},${desc},${e},${action}";

      mkBindSingle =
        key: action: desc:
        ",${key},${desc},${e},${action}";

      mkBindPass =
        mod: key: prog: desc:
        "${mod},${key},${desc},pass,class:${prog}";

      mkBindSend =
        mod: key: prog: orig-mod: orig-key: desc:
        "${mod},${key},${desc},sendshotcut,${orig-mod},${orig-key},class:${prog}";
    in
    {
      bindd =
        let
          terminal = getExe config.programs.ghostty.package;
          browser = getExe config.programs.floorp.package;
          file-manager = getExe pkgs.nautilus;
          editor = "nvim";
          yazi = getExe config.programs.yazi.package;
          hyprlock = getExe config.programs.hyprlock.package;
          btop = getExe config.programs.btop.package;
          copyq = getExe pkgs.copyq;
          swayosd = getExe' config.services.swayosd.package "swayosd-client";
          g4music = getExe pkgs.g4music;
          obs = "^(com\.obsproject\.Studio)$";
          syncthingtray = getExe (
            pkgs.syncthingtray.overrideAttrs {
              meta.mainProgram = "syncthingtray";
            }
          );
        in
        [
          (mkBindExe "super" "e" "hyprctl clients | grep 'nautilus' || ${file-manager}" "Launch file manager")
          (mkBindExe "super" "b" browser "Launch the browser")
          (mkBindExe "altshift" "m" g4music "Open a music player")
          # (mkBindExe "Super" "n" valent "Launch valent")

          (mkBindExe "super" "q" terminal "Launch a terminal")
          (mkBindExe "super" "r" "${terminal} -e ${yazi}" "Launch yazi")
          (mkBindExe "super" "z" "${terminal} -e ${editor}" "Launch a text editor")
          (mkBindExe "super" "m" "${terminal} -e ${btop}" "Launch a system monitor")

          (mkBindExe "supershift" "v" "${copyq} menu" "Launch the clipboard menu")

          (mkBind "supershift" "q" "killactive" "Kill active window")
          (mkBind "supershift" "e" "exit" "Exit hyprland session")
          (mkBind "super" "s" "togglesplit" "Toggle split layout")
          (mkBind "super" "f" "fullscreen" "Toggle fullscreen")
          (mkBind "super" "v" "togglefloating" "Toggle floating")
          (mkBindExe "supershift" "x" "hyprctl reload" "Reload hyprland")

          (mkBindExe "supershift" "l" "${hyprlock} --immediate" "Lock the screen")

          (mkBindSingle "caps_lock" "${swayosd} --caps-lock" "Show caps lock")

          (mkBindExe "super" "grave" idle-inhibit "Turn on the idle inhibitor")

          (mkBindExe "supershift" "m" "${syncthingtray} -w" "Open syncthing tray")

          # OBS Studio global keybindings
          (mkBindSend "shift" "f3" obs "shift" "m" "Mute desktop audio")
          (mkBindSend "shift" "f4" obs "shift" "n" "Mute microphone audio")
          (mkBindSend "shift" "f5" obs "shift" "c" "Split recording file")
          (mkBindSend "shift" "f6" obs "shift" "r" "Start recording")
          (mkBindSend "shift" "f7" obs "shift" "t" "Toggle recording (pause/unpause)")
          (mkBindSend "shift" "f8" obs "shift" "s" "Stop recording")
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
          (mkBindSingle "XF86MonBrightnessUp" raise-brightness "Raise brightness")
          (mkBindSingle "XF86MonBrightnessDown" lower-brightness "Lower brightness")

          (mkBindSingle "XF86AudioRaiseVolume" raise-volume "Raise volume")
          (mkBindSingle "XF86AudioLowerVolume" lower-volume "Lower volume")
          (mkBindSingle "XF86AudioMute" mute "Mute audio")
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
          (mkBindSingle "XF86AudioNext" next "Move to next track")
          (mkBindSingle "XF86AudioPrev" prev "Move to previous track")
          (mkBindSingle "XF86AudioPlay" toggle-play "Pause-play current track")
          (mkBindSingle "XF86AudioStop" stop "Stop current track")

          (mkBindExe "shift" "F12" next "Move to next track")
          (mkBindExe "shift" "F9" prev "Move to previous track")
          (mkBindExe "shift" "F10" toggle-play "Pause-play current track")
          (mkBindExe "shift" "F11" stop "Stop current track")
        ];

      binddr =
        let
          anyrun = getExe config.programs.anyrun.package;
          easyeffects = getExe config.services.easyeffects.package;
          color-picker = getExe inputs.color-picker.packages.${system}.default;
          pk = getExe' pkgs.busybox "pkill";
          nwg-bar = getExe pkgs.nwg-bar;

          iwgtk = getExe pkgs.iwgtk;

          # Screenshots
          hyprshot = getExe pkgs.hyprshot;

          ghostty = getExe pkgs.ghostty;
          overskride = getExe pkgs.overskride;
        in
        [
          (mkBindExe "super" "d" "${pk} anyrun || ${anyrun}" "Launch app launcher")

          (mkBindExe "super" "i" "${pk} iwgtk || ${iwgtk}" "Launch the iwgtk wifi menu")

          (mkBindExe "super" "a" "hyprctl clients | grep 'easyeffects' || ${easyeffects}"
            "Launch easyeffects audio mixer"
          )

          # Color picker
          (mkBindExe "supershift" "c" "${pk} color-picker || ${color-picker}" "Launch the color picker")

          # wlogout
          (mkBindExe "super" "x" nwg-bar "Show login menu")

          # Audio mixer
          (mkBindExe "super" "p" "${pk} pulsemixer || ${ghostty} -e pulsemixer" "Launch pulsemixer")

          # Bluetooth manager
          (mkBindExe "supershift" "i" "${pk} overskride || ${overskride}"
            "Open the Overskride bluetooth manager"
          )

          # Screenshotting
          (mkBindSingle "print" "${pk} hyprshot || ${hyprshot} -m region -z -o ~/Pictures/Screenshots"
            "Take a screenshot of a selected region"
          )
          (mkBindExe "alt" "print" "${pk} hyprshot || ${hyprshot} -m active -z -o ~/Pictures/Screenshots"
            "Take a screenshot of the entire screen"
          )
        ];
    };
}
