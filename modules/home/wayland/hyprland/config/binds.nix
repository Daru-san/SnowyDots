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
          file-manager = getExe pkgs.nautilus;
          yazi = getExe config.programs.yazi.package;
          hyprlock = getExe config.programs.hyprlock.package;
          btop = "${osConfig.security.wrapperDir}/btop";
          terminal = getExe config.programs.foot.package;
          obs = "^(com\.obsproject\.Studio)$";
          copyq = getExe pkgs.copyq;
        in
        [
          (mkBindExeDispatch "workspace 4" "super" "e" file-manager "Launch file manager")
          (mkBindExe "supershift" "v" "${copyq} toggle" "Launch copyq clipboard manager")

          (mkBindExe "super" "q" terminal "Launch a terminal")
          (mkBindExe "super" "r" "${terminal} -e ${yazi}" "Launch yazi")
          (mkBindExe "super" "m" "${terminal} -e ${btop}" "Launch a system monitor")

          (mkBind "supershift" "q" "killactive" "Kill active window")
          (mkBind "supershift" "e" "exit" "Exit hyprland session")
          (mkBind "super" "s" "togglesplit" "Toggle split layout")
          (mkBind "super" "f" "fullscreen" "Toggle fullscreen")
          (mkBind "supershift" "f" "fullscreenstate, 0, 2" "Toggle fake fullscreen")
          (mkBind "super" "v" "togglefloating" "Toggle floating")
          (mkBindExe "supershift" "x" "hyprctl reload" "Reload hyprland")

          (mkBindExe "superalt" "l" "${hyprlock} --immediate" "Lock the screen")

          # OBS Studio global keybindings
          (mkBindSend "shift" "f3" obs "shift" "m" "Mute desktop audio")
          (mkBindSend "shift" "f4" obs "shift" "n" "Mute microphone audio")
          (mkBindSend "shift" "f5" obs "shift" "c" "Split recording file")
          (mkBindSend "shift" "f6" obs "shift" "r" "Start recording")
          (mkBindSend "shift" "f7" obs "shift" "t" "Toggle recording (pause/unpause)")
          (mkBindSend "shift" "f8" obs "shift" "s" "Stop recording")
        ];

      binddle =
        (
          let
            wpctl = getExe' pkgs.wireplumber "wpctl";
            mute = "${wpctl} set-mute @DEFAULT_SINK@ toggle";
            raise-volume = "${wpctl} set-volume @DEFAULT_SINK@ 0.05+";
            lower-volume = "${wpctl} set-volume @DEFAULT_SINK@ 0.05-";
            brightnessctl = getExe pkgs.brightnessctl;
            raise-brightness = "${brightnessctl} set +5%";
            lower-brightness = "${brightnessctl} set 5%-";
          in
          [
            (mkBindSingle "XF86AudioRaiseVolume" raise-volume "Raise volume")
            (mkBindSingle "XF86AudioLowerVolume" lower-volume "Lower volume")
            (mkBindSingle "XF86AudioMute" mute "Mute audio")
            (mkBindSingle "XF86MonBrightnessUp" raise-brightness "Raise brightness")
            (mkBindSingle "XF86MonBrightnessDown" lower-brightness "Lower brightness")
          ]
        )
        ++ (
          let
            # Screenshots
            flameshot = getExe config.services.flameshot.package;
          in
          [
            (mkBindExe "super" "f12" "systemctl suspend" "Suspend system")
            # Screenshotting
            (mkBindSingle "print" "${flameshot} gui" "Take a screenshot of a selected region")

            (mkBindExe "shift" "print" "${flameshot} screen" "Take a screenshot of the whole screen")
          ]
        );

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
          easyeffects = getExe config.services.easyeffects.package;
          fuzzel = getExe config.programs.fuzzel.package;
          pk = getExe' pkgs.busybox "pkill";
          wleave = getExe config.programs.wleave.package;

          iwgtk = getExe pkgs.iwgtk;

          overskride = getExe pkgs.overskride;
        in
        [
          (mkBindExe "super" "d" "${pk} anyrun || ${fuzzel}" "Launch app launcher")

          (mkBindExe "super" "i" "${pk} iwgtk || ${iwgtk}" "Launch the iwgtk wifi menu")

          (mkBindExe "super" "a" "hyprctl clients | grep 'easyeffects' || ${easyeffects}"
            "Launch easyeffects audio mixer"
          )

          (mkBindExe "super" "x" "${pk} wleave || ${wleave}" "Launch the wleave logout menu")

          # Bluetooth manager
          (mkBindExe "supershift" "i" "${pk} overskride || ${overskride}"
            "Open the Overskride bluetooth manager"
          )
        ];
    };
}
