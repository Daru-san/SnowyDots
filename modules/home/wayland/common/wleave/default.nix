{ pkgs, ... }:
let
  getPath = file: "${pkgs.wleave}/share/wleave/icons/${file}.svg";
in
{
  programs.wleave = {
    settings = {
      margin = 200;
      buttons-per-row = "2/1";
      delay-command-ms = 100;
      close-on-lost-focus = true;
      no-version-info = true;
      buttons = [
        {
          label = "lock";
          action = "hyprlock";
          text = "Lock";
          keybind = "l";
          icon = getPath "lock";
        }
        {
          label = "hibernate";
          action = "systemctl hibernate";
          text = "Hibernate";
          keybind = "h";
          icon = getPath "hibernate";
        }
        {
          label = "logout";
          action = "loginctl terminate-user $USER";
          text = "Logout";
          keybind = "e";
          icon = getPath "logout";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
          icon = getPath "shutdown";
        }
        {
          label = "suspend";
          action = "systemctl suspend";
          text = "Suspend";
          keybind = "u";
          icon = getPath "suspend";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "Reboot";
          keybind = "r";
          icon = getPath "reboot";
        }
      ];
    };
  };
}
