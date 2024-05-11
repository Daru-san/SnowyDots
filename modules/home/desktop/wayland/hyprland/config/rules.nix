{lib, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = let
        p = regex: "float,class:(pcmanfm-qt),title:(${regex})";
      in [
        "float,class:(firefox-nightly),title:(Library)"
        (p "Copy Files")
        (p "Move Files")
        (p "Removable medium is inserted")
        (p "Confirm to replace files")
        (p "Preferences")
        (p "Choose an Application")
        (p "Edit Bookmarks")
        (p "Connect to remote server")
        (p "File Properties")
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
          (c "file-roller")
          (c "foot")
          (c "nm-connection-editor")
          (c ".blueman-manager-wrapped")
          (c "org.kde.kdeconnect.daemon")
        ])
        [
          "workspace name:7,^(krita)$"
          "workspace name:8,^(pqiv)$"
          "workspace name:9,^(com.github.wwmmasyeffects)$"

          "workspace name:F1,^(firefox-nightly)$"
          "workspace name:F2,^(osidian)$"
          "workspace name:F4,^(org.gnome.Nautilus)$"
          "workspace name:F5,^(io.bassi.Amberol)$"
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
