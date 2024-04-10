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
          (f "com.github.hluk.copyq")
          (f "file-roller")
          (f "org.kde.kdeconnect.daemon")
          (c "file-roller")
          (c "com.github.hluk.copyq")
          (c "org.kde.kdeconnect.daemon")
        ])
        [
          "workspace name:7,^(krita)$"
          "workspace name:8,^(pqiv)$"
          "workspace name:9,^(com.github.wwmmasyeffects)$"

          "workspace name:F1,^(firefox-nightly)$"
          "workspace name:F2,^(osidian)$"
          "workspace name:F4,^(org.gnome.Nautilus)$"

          "workspace name:F6,^(mpv)$"
          "workspace name:F7,^(FreeTube)$"
          "workspace name:F8,title:^(Spotify)(.*)$"

          "workspace name:F10,^(org.pwmt.zathura)$"
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
