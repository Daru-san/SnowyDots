{ lib, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = lib.flatten [
        "float,class:(zen)(.*),title:(Library)"
        "float,title:(Syncthing Tray)"
        "size 65%,title:(Syncthing Tray)"
        "size 65%,title:(Open Images — Krita)"
        "content none, class:mpv"
        (
          let
            window = [
              "file-roller"
              "iwgtk"
              "nm-connection-editor"
              "org.kde.kdeconnect.daemon"
              ".blueman-manager-wrapped"
              ".clipse-gui-wrapped"
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
            special = workspace: window: "workspace special:${workspace}, class:^(${window})(.*)$";
          in
          [
            (workspace 1 "neovide")

            (workspace 2 "zen")
            (workspace 2 "thunderbird")

            (workspace 4 "org.gnome.Nautilus")

            (workspace 5 "spotify")
            (workspace 5 "io.github.htkhiem.Euphonica")

            (workspace 6 "mpv")

            (workspace 6 "FreeTube")

            (workspace 7 "libreoffice")
            (workspace 7 "org.prismlauncher.PrismLauncher")
            (workspace 7 "Minecraft")
            (workspace 7 ".virt-manager-wrapped")
            (workspace 7 "virt-viewer")

            (workspace 8 "com.obsproject.Studio")
            (workspace 8 "oculante")

            (workspace 8 "org.kde.kdenlive")

            (workspace 8 "^Gimp$")

            (workspace 9 "org.pwmt.zathura")
          ]
        )
      ];
    };
  };
}
