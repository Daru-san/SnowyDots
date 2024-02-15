{
  pkgs,
  lib,
  config,
  ...
}: {
  xdg.configFile."tschuss/icons" = let
    repo = pkgs.fetchFromGitHub {
      owner = "ArtsyMacaw";
      repo = "wlogout";
      rev = "0a4289e02c6c4337756d4df7ff31605f8c8795c3";
      hash = "sha256-cTscfx+erHVFHwwYpN7pADQWt5sq75sQSyXSP/H8kOs=";
    };
  in {
    source = "${repo}/icons";
  };
  home.packages = with pkgs; [tschuss];
  xdg.configFile."tschuss/tschuss.conf".text = ''
    top_text = "";
    bottom_text = "";
    border_width = 0;
    columns = 3;

    size = {
      width = 600;
      height = 400;
    };

    shutdown: {
      title = ""
      label = "";
      image = "icons/shutdown.png";
      img_size = {
          width = 64;
          height = 64;
      };
      description = "Shutdown";
      action = "shutdown now";
      bind = 115;     // 's'
    };

    reboot: {
      title = ""
      label = "";
      image = "icons/reboot.png";
      img_size = {
          width = 64;
          height = 64;
      };
      description = "Reboot";
      action = "reboot";
      bind = 114;     // 'r'
    };

    logout: {
      title = ""
      label = "";
      image = "icons/logout.png";
      img_size = {
          width = 64;
          height = 64;
      };
      description = "Logout";
      action = "logout";
      bind = 108;     // 'l'
    };

    hibernate: {
      title = ""
      label = "";
      image = "icons/hibernate.png";
      img_size = {
          width = 64;
          height = 64;
      };
      description = "Hibernate";
      action = "systemctl hibernate";
      bind = 104;     // 'h'
    };

    suspend: {
      title = ""
      label = "";
      image = "icons/suspend.png";
      img_size = {
          width = 64;
          height = 64;
      };
      description = "Suspend";
      action = "systemctl suspend";
      bind = 117;     // 'u'
    };

    lock: {
      title = ""
      label = "";
      image = "icons/lock.png";
      img_size = {
          width = 64;
          height = 64;
      };
      description = "Lock";
      action = "gtklock -id";
      bind = 107;     // 'k'
    };
  '';
  xdg.configFile."tschuss/style.css".text = ''
    ${with builtins; readFile config.theme.colorScheme.css};
    ${with builtins; readFile ./style.css}
  '';
}
