{
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        #Special rules for firefox
        "float,class:(firefox-nightly),title:(Library)"
      ];
      windowrule = let
        f = regex: "float, ^(${regex})$";
        c = regex: "center, ^(${regex})$";
      in
        [
          # Floating windows
          (f "com.github.hluk.copyq")
          (f "file-roller")
          (f "org.kde.kdeconnect.daemon")

          # Center them
          (c "file-roller")
          (c "com.github.hluk.copyq")
          (c "org.kde.kdeconnect.daemon")
        ]
        ++ [
          #Window specific worspaces
          "workspace name:7,^(krita)$"
          "workspace name:8,^(pqiv)$"
          "workspace name:9,^(com.github.wwmmasyeffects)$"

          #Productivity workspaces
          "workspace name:F1,^(firefox-nightly)$"
          "workspace name:F2,^(osidian)$"
          "workspace name:F4,^(org.gnome.Nautilus)$"

          #Entertainment workspaces
          "workspace name:F6,^(mpv)$"
          "workspace name:F7,^(FreeTube)$"
          "workspace name:F8,title:^(Spotify)(.*)$"

          #Others
          "workspace name:F10,^(org.pwmt.zathura)$"
        ]
        ++
        # tschuss
        (let
          t = regex: "${regex},^(wlogout)$";
        in [
          (t "fullscreen")
          (t "noanim")
          (t "stayfocused")
          (t "pin")
          (t "dimaround")
        ]);
      workspace = [
        "name:F9, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
        "name:F10, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
        "name:F11, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
        "name:F12, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
      ];
    };
  };
}
