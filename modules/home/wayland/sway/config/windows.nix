{lib, ...}: {
  wayland.windowManager.sway.config = {
    workspaceAutoBackAndForth = true;
    assigns = {
      "8" = [{class = "oculante";}];
      "F1" = [{class = "^firefox$";}];
      "F2" = [{class = "bridge";}];
      "F4" = [{class = "^Nautilus$";}];
      "F6" = [{class = "mpv";}];
      "F7" = [{class = "^FreeTube$";}];
      "F8" = [{title = "^Spotify$";}];
      "F11" = [{class = "^Zathura$";}];
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
      map (x: {
        command = "layout stacking";
        criteria.class = "^${x}$";
      })
      stacks;
    floating = {
      border = 6;
      criteria = let
        classes = [
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
        ];
        titles = [
          "CopyQ"
          "Bluetooth Devices"
          "Easy Effects"
        ];
      in
        lib.flatten [
          (map (x: {class = "^${x}$";}) classes)
          (map (x: {title = "^${x}$";}) titles)
          {
            title = "Library";
            class = "firefox";
          }
        ];
      titlebar = false;
    };
  };
}
