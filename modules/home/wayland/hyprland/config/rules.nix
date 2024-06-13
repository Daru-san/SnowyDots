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
          ];
          resized-windows = [
            "foot"
            "org.twosheds.iwgtk"
            "com.github.wwmm.easyeffects"
          ];
        in [
          (map (x: "float,^(${x})(.*)$") window)
          (map (x: "center,^(${x})(.*)$") window)
          (map (c: "size 60%,^(${c})(.*)$") resized-windows)
        ])
        (let
          w = x: y: "workspace ${toString x},^(${y})(.*)$";
          wt = x: y: "workspace ${toString x},title:(${y})(.*)$";
          g = x: "group,^(${x})$";
        in [
          (g "swayimg")
          (w 8 "swayimg")

          (w 2 "firefox")
          (w 4 "org.gnome.Nautilus")

          (w 5 "com.github.neithern.g4music")

          (g "mpv")
          (w 5 "mpv")

          (w 5 "FreeTube")
          (wt 4 "Spotify")

          (g "virt-manager")
          (w 9 "virt-manager")

          (g "org.pwmt.zathura")
          (w 9 "org.pwmt.zathura")

          (g "org.prismlauncher.PrismLauncher")
          (g "Minecraft")
          (w 6 "org.prismlauncher.PrismLauncher")
          (w 6 "Minecraft")
        ])
        (let
          rules = ["fullscreen" "noanim" "stayfocused" "pin" "dimaround"];
        in
          map (x: "${x},^(wlogout)$") rules)
      ];
    };
  };
}
