{ lib, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = lib.flatten [
        "float,class:(zen)(.*),title:(Library)"
        "float,title:(Syncthing Tray)"
        "size 65%,title:(Syncthing Tray)"
        "size 65%,title:(Open Images — Krita)"
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
              "xdg-desktop-portal-gtk"
              "io.github.kaii_lb.Overskride"
              "io.github.giantpinkrobots.varia"
            ];
            resized-windows = [
              "foot"
              "nmtui"
              "pulsemixer"
              "org.freedesktop.impl.portal.desktop.kde"
              "xdg-desktop-portal-gtk"
              "xdg-desktop-portal-kde"
              "org.gnome.FileRoller"
              "org.twosheds.iwgtk"
              "valent"
              "com.github.wwmm.easyeffects"
              "io.github.kaii_lb.Overskride"
              "io.github.giantpinkrobots.varia"
            ];
          in
          [
            (map (c: "float,class:^(${c})(.*)$") window)
            (map (d: "center,class:^(${d})(.*)$") window)
            (map (e: "size 60%,class:^(${e})(.*)$") resized-windows)
          ]
        )
        (
          let
            workspace = index: window: "workspace ${toString index}, class:^(${window})(.*)$";
            workspace-title = index: window: "workspace ${toString index}, title:(${window})(.*)$";
            special = workspace: window: "workspace special:${workspace}, class:^(${window})(.*)$";
            group = x: "group, class:^(${x})$";
          in
          [
            (special "obs-studio" "com.obsproject.Studio")
            (special "virt-manager" ".virt-manager-wrapped")

            (workspace 1 "neovide")
            (group "neovide")

            (workspace 2 "zen")
            (group "zen")
            (workspace 2 "thunderbird")
            (group "thunderbird")

            (workspace 4 "org.gnome.Nautilus")

            (workspace 5 "spotify")

            (workspace 6 "mpv")
            (group "mpv")

            (workspace 6 "FreeTube")

            (workspace 7 "libreoffice")
            (workspace 7 "org.prismlauncher.PrismLauncher")
            (workspace 7 "Minecraft")

            (group "oculante")
            (workspace 8 "oculante")

            (workspace 8 "org.kde.kdenlive")
            (group "org.kde.kdenlive")

            (workspace 8 "^Gimp$")
            (group "^Gimp$")

            (workspace 9 "org.pwmt.zathura")
            (group "org.pwmt.zathura")
          ]
        )
      ];
    };
  };
}
