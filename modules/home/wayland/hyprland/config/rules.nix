{lib, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "float,class:(firefox)(.*),title:(Library)"
        "float,class:(firefox)(.*),title:(About Mozilla Firefox)"
      ];
      windowrule = lib.flatten [
        (let
          f = x: "float,^(${x})(.*)$";
          c = x: "center,^(${x})(.*)$";
          s = x: "size 60%,^(${x})(.*)$";
        in [
          (f "file-roller")
          (f "foot")
          (f "iwgtk")
          (f "nm-connection-editor")
          (f "org.kde.kdeconnect.daemon")
          (f ".blueman-manager-wrapped")
          (f "org.twosheds.iwgtk")
          (f "com.github.hluk.copyq")
          (c "file-roller")
          (c "foot")
          (c "com.github.hluk.copyq")
          (c "iwgtk")
          (c "org.twosheds.iwgtk")
          (c "nm-connection-editor")
          (c ".blueman-manager-wrapped")
          (c "org.kde.kdeconnect.daemon")
          (s "foot")
          (s "org.twosheds.iwgtk")
        ])
        (let
          w = x: y: "workspace name:${toString x},^(${y})(.*)$";
          wf = x: y: "workspace name:F${toString x},^(${y})(.*)$";
          wtf = x: y: "workspace name:F${toString x},title:(${y})(.*)$";
          g = x: "group,^(${x})$";
        in [
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
          t = x: "${x},^(wlogout)$";
        in [(t "fullscreen") (t "noanim") (t "stayfocused") (t "pin") (t "dimaround")])
      ];
      workspace = let
        s = x: "name:F${toString x}, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false";
      in [(s 9) (s 10) (s 11) (s 12)];
    };
  };
}
