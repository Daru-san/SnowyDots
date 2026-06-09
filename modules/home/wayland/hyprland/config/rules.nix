{ lib, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      layerrule = [
        {
          name = "noctalia";
          match.namespace = "noctalia-background-.*$";
          ignore_alpha = 0.5;
          blur = true;
          blur_popups = true;
        }
      ];
      windowrule = lib.flatten [
        "match:title (Open Images — Krita), size 65% 65%"
        "match:class mpv, content none"
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
            (map (c: "match:class ^(${c})(.*)$, float true") window)
            (map (d: "match:class ^(${d})(.*)$, center true") window)
            (map (e: "match:class ^(${e})(.*)$, size 60% 60%") resized-windows)
          ]
        )
        (
          let
            workspace = index: window: "match:class ^(${window})(.*)$, workspace ${toString index}";
          in
          [
            (workspace 1 "neovide")

            (workspace 2 "zen")
            (workspace 2 "thunderbird")

            "match:class ^(org.gnome.Nautilus)(.*)$, match:title ^(?!Save).+$, workspace 4"

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

            (workspace 8 "gimp")

            (workspace 9 "org.pwmt.zathura")
            (workspace 9 "sioyek")
          ]
        )
      ];
    };
  };
}
