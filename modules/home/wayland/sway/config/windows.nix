{lib, ...}: {
  wayland.windowManager.sway.config = {
    workspaceAutoBackAndForth = true;
    assigns = {
      "0" = [{app_id = "btop";}];
      "2" = [{app_id = "^firefox$";}];
      "3" = [{app_id = "^org.gnome.Nautilus$";}];
      "4" = [{title = "^Spotify Free$";} {app_id = "^g4music$";}];
      "5" = [{app_id = "^FreeTube$";} {app_id = "^mpv$";}];
      "6" = [{app_id = "^Minecraft$";} {add_id = "^org.prismlauncher.PrismLauncher";}];
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
        ];
        titles = [
          "CopyQ"
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
