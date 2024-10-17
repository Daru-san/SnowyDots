{ lib, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "float,class:(firefox)(.*),title:(Library)"
        "float,class:(firefox)(.*),title:(About Mozilla Firefox)"
        "float,class:(lazarus),title:(Completion)"
      ];
      windowrule = lib.flatten [
        [
          "float,title:(Syncthing Tray)"
          "size 65%,title:(Syncthing Tray)"
        ]
        [
          "size 65%,title:(Open Images — Krita)"
        ]
        (
          let
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
              "xdg-desktop-portal-kde"
              "io.github.kaii_lb.Overskride"
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
              "io.github.kaii_lb.Overskride"
            ];
          in
          [
            (map (c: "float,^(${c})(.*)$") window)
            (map (d: "center,^(${d})(.*)$") window)
            (map (e: "size 60%,^(${e})(.*)$") resized-windows)
          ]
        )
        (
          let
            w = x: y: "workspace ${toString x},^(${y})(.*)$";
            wt = x: y: "workspace ${toString x},title:(${y})(.*)$";
            g = x: "group,^(${x})$";
          in
          [
            (w 2 "firefox")
            (w 4 "org.gnome.Nautilus")

            (wt 5 "Spotify")

            (w 6 "mpv")

            (w 6 "FreeTube")

            (w 7 "libreoffice")
            (w 7 "org.prismlauncher.PrismLauncher")
            (w 7 "Minecraft")
            (w 7 "com.obsproject.Studio")

            (g "oculante")
            (w 8 "oculante")

            (w 8 "org.kde.kdenlive")
            (g "org.kde.kdenlive")

            (w 8 "krita")
            (g "krita")

            (w 9 "virt-manager")

            (w 9 "org.pwmt.zathura")
            (g "org.pwmt.zathura")
            (w 9 "jetbrains-studio")
          ]
        )
        (
          let
            rules = [
              "fullscreen"
              "noanim"
              "stayfocused"
              "pin"
              "dimaround"
            ];
          in
          map (x: "${x},^(wlogout)$") rules
        )
      ];
    };
  };
}
