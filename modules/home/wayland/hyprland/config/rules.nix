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
          ];
          resized-windows = [
            "foot"
            "org.twosheds.iwgtk"
          ];
        in [
          (map (x: "float,^(${x})(.*)$") window)
          (map (x: "center,^(${x})(.*)$") window)
          (map (c: "size 60%,^(${c})(.*)$") resized-windows)
        ])
        (let
          w = x: y: "workspace name:${toString x},^(${y})(.*)$";
          wf = x: y: "workspace name:F${toString x},^(${y})(.*)$";
          wtf = x: y: "workspace name:F${toString x},title:(${y})(.*)$";
          g = x: "group,^(${x})$";
        in [
          (w 7 "uget-gtk")
          (g "oculante")
          (w 8 "oculante")

          (w 9 "com.github.wwmm.easyeffects")

          (wf 1 "firefox")
          (wf 2 "obsidian")
          (wf 3 "libreoffice")
          (wf 4 "org.gnome.Nautilus")

          (wf 5 "io.bassi.Amberol")

          (g "mpv")
          (wf 6 "mpv")

          (wf 7 "FreeTube")
          (wtf 8 "Spotify")

          (g "virt-manager")
          (wf 9 "virt-manager")

          (g "org.pwmt.zathura")
          (wf 10 "org.pwmt.zathura")

          (g "org.prismlauncher.PrismLauncher")
          (g "Minecraft")
          (wf 12 "org.prismlauncher.PrismLauncher")
          (wf 12 "Minecraft")
        ])
        (let
          rules = ["fullscreen" "noanim" "stayfocused" "pin" "dimaround"];
        in
          map (x: "${x},^(wlogout)$") rules)
      ];
      workspace = let
        inherit (lib) range;
        workspaces = map (n: "F${toString n}") (range 9 12);
      in
        map (x: "name:${x},rounding:false, decorate:false, gapsin:0, gapsout:0, border:false") workspaces;
    };
  };
}
