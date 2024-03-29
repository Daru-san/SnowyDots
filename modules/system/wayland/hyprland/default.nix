{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
  mkIf config.programs.hyprland.enable {
    programs = {
      dconf.enable = true;
      file-roller.enable = true;
    };
    services.gnome = {
      gnome-settings-daemon.enable = true;
      gnome-keyring.enable = true;
      sushi.enable = true;
      tracker.enable = true;
      tracker-miners.enable = true;
    };
    services.greetd = {
      package = pkgs.greetd;
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t --window-padding 1 -g 'Welcome to ${config.networking.hostName}' -c Hyprland";
          user = "daru";
        };
        default_session = initial_session;
      };
    };
    environment.systemPackages = with pkgs.lxqt; [lxqt-policykit];
  }
