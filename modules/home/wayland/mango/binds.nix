{
  config,
  pkgs,
  lib,
  osConfig,
  ...
}:
let
  inherit (lib) getExe getExe';
in
{
  imports = [
    ./extra-binds.nix
  ];
  wayland.windowManager.mango.settings =
    let
      e = "spawn";
      mkBind =
        mods: key: action: desc:
        "${mods}, ${key}, ${action}";

      mkBindExe =
        mods: key: action: desc:
        "${mods}, ${key}, ${e}, ${action}";

      mkBindExeSh =
        mods: key: action: desc:
        "${mods}, ${key}, spawn_shell, ${action}";

      mkBindSingle =
        key: action: desc:
        "NONE, ${key}, ${e}, ${action}";
    in
    {
      bind =
        let
          file-manager = getExe pkgs.kdePackages.dolphin;
          yazi = getExe config.programs.yazi.package;
          hyprlock = getExe config.programs.hyprlock.package;
          btop = "${osConfig.security.wrapperDir}/btop";
          terminal = getExe config.programs.foot.package;
          copyq = getExe pkgs.copyq;
        in
        [
          (mkBindExe "SUPER" "e" file-manager "Launch file manager")
          (mkBindExe "SUPER+SHIFT" "v" "${copyq} toggle" "Launch copyq clipboard manager")

          (mkBindExe "SUPER" "q" terminal "Launch a terminal")
          (mkBindExe "SUPER" "r" "${terminal} -e ${yazi}" "Launch yazi")
          (mkBindExe "SUPER" "m" "${terminal} -e ${btop}" "Launch a system monitor")

          (mkBind "SUPER+SHIFT" "q" "killclient" "Kill active window")
          (mkBind "SUPER+SHIFT" "e" "quit" "Exit mango session")
          (mkBind "SUPER" "f" "togglefullscreen" "Toggle fullscreen")
          (mkBind "SUPER+SHIFT" "f" "togglefakefullscreen" "Toggle fake fullscreen")
          (mkBind "SUPER" "v" "togglefloating" "Toggle floating")
          (mkBind "SUPER" "c" "sleep_toggle_monitor" "Toggle monitor DPMS")
          (mkBindExe "SUPER+SHIFT" "x" "reload_config" "Reload mango")

          (mkBindExe "SUPER+ALT" "l" "${hyprlock} --immediate" "Lock the screen")
        ];

      bindl =
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
            (mkBindExe "SUPER" "f12" "systemctl suspend" "Suspend system")
            # Screenshotting
            (mkBindSingle "print" "${flameshot} gui" "Take a screenshot of a selected region")

            (mkBindExe "SHIFT" "print" "${flameshot} screen" "Take a screenshot of the whole screen")
          ]
        )
        ++ (
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

            (mkBindExe "SHIFT" "F12" next "Move to next track")
            (mkBindExe "SHIFT" "F9" prev "Move to previous track")
            (mkBindExe "SHIFT" "F10" toggle-play "Pause-play current track")
            (mkBindExe "SHIFT" "F11" stop "Stop current track")
          ]
        );

      bindr =
        let
          easyeffects = getExe config.services.easyeffects.package;
          fuzzel = getExe config.programs.fuzzel.package;
          pk = getExe' pkgs.busybox "pkill";
          wleave = getExe config.programs.wleave.package;
          iwgtk = getExe pkgs.iwgtk;
          overskride = getExe pkgs.overskride;
        in
        [
          (mkBindExeSh "SUPER" "d" "${pk} anyrun || ${fuzzel}" "Launch app launcher")

          (mkBindExeSh "SUPER" "i" "${pk} iwgtk || ${iwgtk}" "Launch the iwgtk wifi menu")

          (mkBindExeSh "SUPER" "a" "hyprctl clients | grep 'easyeffects' || ${easyeffects}"
            "Launch easyeffects audio mixer"
          )

          (mkBindExeSh "SUPER" "x" "${pk} wleave || ${wleave}" "Launch the wleave logout menu")

          # Bluetooth manager
          (mkBindExeSh "SUPER+SHIFT" "i" "${pk} overskride || ${overskride}"
            "Open the Overskride bluetooth manager"
          )
        ];
    };
}
