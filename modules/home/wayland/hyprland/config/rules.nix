{lib, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "float,class:(firefox)(.*),title:(Library)"
        "float,class:(firefox)(.*),title:(About Mozilla Firefox)"
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
          ];
          resized-windows = [
            "foot"
            "nmtui"
            "pulsemixer"
            "org.freedesktop.impl.portal.desktop.kde"
            "org.gnome.FileRoller"
            "org.twosheds.iwgtk"
            "com.github.wwmm.easyeffects"
          ];
        in [
          (map (c: "float,^(${c})(.*)$") window)
          (map (d: "center,^(${d})(.*)$") window)
          (map (e: "size 60%,^(${e})(.*)$") resized-windows)
        ])
        (let
          w = x: y: "workspace ${toString x},^(${y})(.*)$";
          wt = x: y: "workspace ${toString x},title:(${y})(.*)$";
          g = x: "group,^(${x})$";
        in [
          (g "oculante")
          (w 8 "oculante")

          (w 7 "libreoffice")

          (w 2 "firefox")
          (w 4 "org.gnome.Nautilus")

          (w 5 "com.github.neithern.g4music")

          (g "mpv")
          (w 6 "mpv")

          (w 6 "FreeTube")
          (wt 5 "Spotify")

          (g "virt-manager")
          (w 9 "virt-manager")

          (g "org.pwmt.zathura")
          (w 9 "org.pwmt.zathura")

          (g "org.prismlauncher.PrismLauncher")
          (g "Minecraft")
          (w 7 "org.prismlauncher.PrismLauncher")
          (w 7 "Minecraft")
        ])
        (let
          rules = ["fullscreen" "noanim" "stayfocused" "pin" "dimaround"];
        in
          map (x: "${x},^(wlogout)$") rules)
      ];
    };
  };
}
