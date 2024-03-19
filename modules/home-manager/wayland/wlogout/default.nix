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
    style = let
      icons =
        pkgs.fetchFromGitHub {
          owner = "ArtsyMacaw";
          repo = "wlogout";
          rev = "bc76e5d2433d234cce0e923fd386429759ef8f7a";
          hash = "sha256-5ikvElaMYdg7jtSsn26FH1SvhEUhqgw9J6V9y/aPzIc=";
        }
        + "/icons";
    in
      builtins.concatStringsSep "\n" [
        ''
          root: {
            --shutdown: url(${icons}/shutdown.png)
            --reboot: url(${icons}/reboot.png)
            --lock: url(${icons}/lock.png)
            --logout: url(${icons}/logout.png)
            --suspend: url(${icons}/suspend.png)
            --hibernate: url(${icons}/hibernate.png)
          }
        ''
        config.theme.colorScheme.css
        (builtins.readFile ./style.css)
      ];
  };
}
