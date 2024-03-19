{
  config,
  pkgs,
  ...
}: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "shutdown -r now";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        text = "Logout/Exit";
        keybind = "e";
      }
      {
        label = "Lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "Suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "s";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
    ];
    xdg.configFile."wlogout/icons".source =
      pkgs.fetchFromGitHub {
        owner = "ArtsyMacaw";
        repo = "wlogout";
        rev = "bc76e5d2433d234cce0e923fd386429759ef8f7a";
        hash = "sha256-5ikvElaMYdg7jtSsn26FH1SvhEUhqgw9J6V9y/aPzIc=";
      }
      + "/icons";
    style = builtins.concatStringsSep "\n" [
      config.theme.colorScheme.css
      (builtins.readFile ./style.css)
    ];
  };
}
