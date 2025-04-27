{ lib, ... }:
{
  wayland.windowManager.sway.config = {
    workspaceAutoBackAndForth = true;
    assigns = {
      "1" = [ { app_id = "^neovide$"; } ];
      "2" = [
        { app_id = "^firefox$"; }
        { app_id = "^brave$"; }
        { app_id = "^zen$"; }
        { app_id = "floorp"; }
      ];
      "3" = [
        { app_id = "btop"; }
        { title = "btop"; }
      ];
      "4" = [ { app_id = "^org.gnome.Nautilus$"; } ];
      "5" = [
        { title = "^Spotify Free$"; }
        { app_id = "^spotify$"; }
        { app_id = "^com.github.neithern.g4music$"; }
      ];
      "6" = [
        { app_id = "^FreeTube$"; }
        { app_id = "^mpv$"; }
      ];
      "7" = [
        { app_id = "^Minecraft$"; }
        { app_id = "^org.prismlauncher.PrismLauncher"; }
        { app_id = "com.obsproject.Studio"; }
        { app_id = ".virt-manager-wrapped"; }
        { app_id = "^waydroid$"; }
      ];
      "8" = [
        { app_id = "oculante"; }
        { app_id = "^Gimp$"; }
        { app_id = "^krita$"; }
        { app_id = "org.kde.kdenlive"; }
      ];
      "9" = [ { app_id = "^org.pwmt.zathura$"; } ];
    };
    window.commands =
      let
        stacks = [
          "mpv"
          "zathura"
          "Minecraft"
          "org.prismlauncher.PrismLauncher"
          "org.pwmt.zathura"
          "virt-manager"
          "oculante"
          "org.kde.kdenlive"
        ];
      in
      [
        {
          command = "resize set 60ppt 60ppt";
          criteria.app_id = "^valent$";
        }
        {
          command = "resize set 70ppt 70ppt";
          criteria.app_id = "^easyeffects$";
        }
        {
          command = "resize set 60ppt 60ppt";
          criteria.app_id = "nmtui";
        }
        {
          command = "resize set 60ppt 60ppt";
          criteria.app_id = "^clipse-gui$";
        }
        {
          command = "resize set 60ppt 60ppt";
          criteria.app_id = "org.freedesktop.impl.portal.desktop.kde";
        }
        {
          command = "resize set 60ppt 60ppt";
          criteria.app_id = "pulsemixer";
        }
        {
          command = "resize set 60ppt 60 ppt";
          criteria.app_id = "^org.twosheds.iwgtk$";
        }
      ]
      ++ map (x: {
        command = "layout tabbed";
        criteria.app_id = "^${x}$";
      }) stacks;
    floating = {
      border = 6;
      criteria =
        let
          app_ids = [
            "file-roller"
            "foot"
            "iwgtk"
            "nm-connection-editor"
            "org.kde.kdeconnect.daemon"
            ".blueman-manager-wrapped"
            "org.freedesktop.impl.portal.desktop.kde"
            "org.twosheds.iwgtk"
            "com.github.hluk.copyq"
            "copyq"
            "pwvucontrol"
            "valent"
            "org.kde.kdeconnect-indicator"
            "swaymux"
            "nmtui"
            "pulsemixer"
            "clipse-gui"
            ".clipse-gui-wrapped"
          ];
          titles = [
            "CopyQ"
            "nmtui"
            "pulsemixer"
            "Bluetooth Devices"
            "Easy Effects"
          ];
        in
        lib.flatten [
          (map (x: { app_id = "^${x}$"; }) app_ids)
          (map (x: { title = "^${x}$"; }) titles)
          { window_type = "dialog"; }
          { window_role = "dialog"; }
          {
            title = "Library";
            app_id = "firefox";
          }
        ];
      titlebar = false;
    };
  };
}
