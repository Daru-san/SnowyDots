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
in
{
  imports = [ ./extra-binds.nix ];
  wayland.windowManager.hyprland.settings =
    let
      e = "exec";
      mkBind =
        mods: key: action: desc:
        "${mods}, ${key}, ${desc}, ${action}";

      mkBindExe =
        mods: key: action: desc:
        "${mods}, ${key}, ${desc}, ${e}, ${action}";

      mkBindExeDispatch =
        dispatcher: mods: key: action: desc:
        "${mods}, ${key}, ${desc}, ${e}, [${dispatcher}] ${action}";

      mkBindSingle =
        key: action: desc:
        ", ${key}, ${desc}, ${e}, ${action}";

      mkBindPass =
        mod: key: prog: desc:
        "${mod}, ${key}, ${desc}, pass, class:${prog}";

      mkBindSend =
        mod: key: prog: orig-mod: orig-key: desc:
        "${mod}, ${key}, ${desc}, sendshortcut, ${orig-mod}, ${orig-key}, class:${prog}";
    in
    {
      bindd =
        let
          browser = getExe config.programs.zen.package;
          file-manager = getExe pkgs.nautilus;
          editor = "${getExe pkgs.neovide} --neovim-bin ${getExe config.env.editor.package}";
          yazi = getExe config.programs.yazi.package;
          hyprlock = getExe config.programs.hyprlock.package;
          btop = getExe config.programs.btop.package;
          swayosd = getExe' config.services.swayosd.package "swayosd-client";
          # terminal = getExe inputs.smitty.packages.${system}.smitty;
          terminal = getExe config.programs.wezterm.package;
          obs = "^(com\.obsproject\.Studio)$";
          copyq = getExe pkgs.copyq;
        in
        [
          # (mkBindExe "super" "e" "hyprctl clients | grep 'nautilus' || ${file-manager}" "Launch file manager")
          (mkBindExeDispatch "workspace 4" "super" "e" file-manager "Launch file manager")

          (mkBindExe "super" "b" browser "Launch the browser")

          # (mkBindExe "Super" "n" valent "Launch valent")
          (mkBindExe "supershift" "v" "${copyq} menu" "Launch copyq clipboard manager")

          (mkBindExe "super" "q" terminal "Launch a terminal")
          (mkBindExe "super" "r" "${terminal} -e ${yazi}" "Launch yazi")
          (mkBindExe "super" "z" editor "Launch a text editor")
          (mkBindExe "super" "m" "${terminal} -e ${btop}" "Launch a system monitor")

          (mkBind "supershift" "q" "killactive" "Kill active window")
          (mkBind "supershift" "e" "exit" "Exit hyprland session")
          (mkBind "super" "s" "togglesplit" "Toggle split layout")
          (mkBind "super" "f" "fullscreen" "Toggle fullscreen")
          (mkBind "super" "v" "togglefloating" "Toggle floating")
          (mkBindExe "supershift" "x" "hyprctl reload" "Reload hyprland")
          (mkBindExe "super" "f12" "systemctl suspend" "Suspend system")

          (mkBindExe "supershift" "l" "${hyprlock} --immediate" "Lock the screen")

          (mkBindSingle "caps_lock" "${swayosd} --caps-lock" "Show caps lock")

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

          iwgtk = getExe pkgs.iwgtk;

          # Screenshots
          flameshot = getExe config.services.flameshot.package;

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

          # Audio mixer
          (mkBindExe "super" "p" "${pk} pulsemixer || ${ghostty} -e pulsemixer" "Launch pulsemixer")

          # Bluetooth manager
          (mkBindExe "supershift" "i" "${pk} overskride || ${overskride}"
            "Open the Overskride bluetooth manager"
          )

          # Screenshotting
          (mkBindSingle "print" "${flameshot} gui" "Take a screenshot of a selected region")

          (mkBindExe "shift" "print" "${flameshot} screen" "Take a screenshot of the whole screen")
        ];
    };
}
