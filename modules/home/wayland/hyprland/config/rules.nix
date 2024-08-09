{lib, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "float,class:(firefox)(.*),title:(Library)"
        "float,class:(firefox)(.*),title:(About Mozilla Firefox)"
        "float,class:(lazarus),title:(Completion)"
      ];
      windowrule = lib.flatten [
        (let
          window = [
            "file-roller"
            "foot"
            "iwgtk"
            "nm-connection-editor"
            "org.kde.kdeconnect.daemon"
            ".blueman-manager-wrapped"
            "org.twosheds.iwgtk"
            "com.github.hluk.copyq"
            "com.github.wwmm.easyeffects"
            "Generate Password"
            "org.gnome.FileRoller"
            "org.freedesktop.impl.portal.desktop.kde"
            "nmtui"
            "pulsemixer"
            "valent"
            "org.kde.rsibreak"
            "xdg-desktop-portal-kde"
          ];
          resized-windows = [
            "foot"
            "nmtui"
            "pulsemixer"
            "org.freedesktop.impl.portal.desktop.kde"
            "xdg-desktop-portal-kde"
            "org.gnome.FileRoller"
            "org.twosheds.iwgtk"
            "valent"
            "com.github.wwmm.easyeffects"
          ];
        in [
          (map (c: "float,^(${c})(.*)$") window)
          (map (d: "center,^(${d})(.*)$") window)
          (map (e: "size 60%,^(${e})(.*)$") resized-windows)
        ])
        (let
          rules = ["fullscreen" "noanim" "stayfocused" "pin" "dimaround"];
        in
          map (x: "${x},^(wlogout)$") rules)
      ];
    };
  };
}
