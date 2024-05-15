{lib, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "float,class:(firefox-nightly),title:(Library)"
      ];
      windowrule = lib.mkMerge [
        (let
          f = regex: "float,^(${regex})$";
          c = regex: "center,^(${regex})$";
        in [
          (f "file-roller")
          (f "foot")
          (f "nm-connection-editor")
          (f "org.kde.kdeconnect.daemon")
          (f ".blueman-manager-wrapped")
          (f "org.twosheds.iwgtk")
          (c "file-roller")
          (c "foot")
          (c "org.twosheds.iwgtk")
          (c "nm-connection-editor")
          (c ".blueman-manager-wrapped")
          (c "org.kde.kdeconnect.daemon")
        ])
        [
          "workspace name:7,^(krita)$"

          "group,^(oculante)$"
          "workspace name:8,^(oculante)$"

          "workspace name:9,^(com.github.wwmm.easyeffects)$"

          "workspace name:F1,^(firefox-nightly)$"
          "workspace name:F2,^(osidian)$"
          "workspace name:F3,^(libreoffice)(.*)$"
          "workspace name:F4,^(org.gnome.Nautilus)$"
          "workspace name:F5,^(io.bassi.Amberol)$"

          "group,(mpv)$"
          "workspace name:F6,^(mpv)$"

          "workspace name:F7,^(FreeTube)$"
          "workspace name:F8,title:^(Spotify)(.*)$"

          "group,^(org.pwmt.zathura)$"
          "workspace name:F10,^(org.pwmt.zathura)$"

          "group,^(org.prismlauncher.PrismLauncher)$"
          "workspace name:F12,^(org.prismlauncher.PrismLauncher)$"
          "group,^(Minecraft)(.*)$"
          "workspace name:F12,(Minecraft)(.*)$"
        ]
        (let
          t = regex: "${regex},^(wlogout)$";
        in [
          (t "fullscreen")
          (t "noanim")
          (t "stayfocused")
          (t "pin")
          (t "dimaround")
        ])
      ];
      workspace = [
        "name:F9, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
        "name:F10, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
        "name:F11, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
        "name:F12, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
      ];
    };
  };
}
