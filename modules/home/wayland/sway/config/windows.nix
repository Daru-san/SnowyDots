{lib, ...}: {
  wayland.windowManager.sway.config = {
    workspaceAutoBackAndForth = true;
    assigns = {
      "2" = [{app_id = "^firefox$";}];
      "3" = [{app_id = "btop";}];
      "4" = [{app_id = "^org.gnome.Nautilus$";}];
      "5" = [{title = "^Spotify Free$";} {app_id = "^com.github.neithern.g4music$";}];
      "6" = [{app_id = "^FreeTube$";} {app_id = "^mpv$";}];
      "7" = [{app_id = "^Minecraft$";} {app_id = "^org.prismlauncher.PrismLauncher";}];
      "8" = [{app_id = "oculante";}];
      "9" = [{app_id = "^org.pwmt.zathura$";}];
    };
    window.commands = let
      stacks = [
        "mpv"
        "zathura"
        "Minecraft"
        "org.prismlauncher.PrismLauncher"
        "org.pwmt.zathura"
        "virt-manager"
        "oculante"
      ];
    in
      [
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
          criteria.app_id = "pulsemixer";
        }
        {
          command = "resize set 60ppt 60 ppt";
          criteria.app_id = "^org.twosheds.iwgtk$";
        }
      ]
      ++ map (x: {
        command = "layout stacking";
        criteria.app_id = "^${x}$";
      })
      stacks;
    floating = {
      border = 6;
      criteria = let
        app_ids = [
          "file-roller"
          "foot"
          "iwgtk"
          "nm-connection-editor"
          "org.kde.kdeconnect.daemon"
          ".blueman-manager-wrapped"
          "org.twosheds.iwgtk"
          "com.github.hluk.copyq"
          "copyq"
          "pwvucontrol"
          "org.kde.kdeconnect-indicator"
          "swaymux"
          "nmtui"
          "pulsemixer"
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
          (map (x: {app_id = "^${x}$";}) app_ids)
          (map (x: {title = "^${x}$";}) titles)
          {window_type = "dialog";}
          {window_role = "dialog";}
          {
            title = "Library";
            app_id = "firefox";
          }
        ];
      titlebar = false;
    };
  };
}
