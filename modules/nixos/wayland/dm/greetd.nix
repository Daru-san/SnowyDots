{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.wayland.greetd;
in  
with lib;
{
  options = {
    wayland.greetd = {
      enable = mkEnableOption "A greeter for wayland";
      user = mkOption {
        default = "user";
        type = with types; str;
        example = "username";
        description = ''
          The username of the greeter greetd will use
        '';
      };
      command = mkOption {
        default = "sway";
        type = with types; str;
        description = ''
          The command of the desktop greetd should use when logging in
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    services.greetd = {
      package = pkgs.greetd;
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t --window-padding 1 -g 'Welcome to ${config.networking.hostName}' -c ${cfg.command}";
          user = "${cfg.user}";
        };
        default_session = initial_session;
      };
    };
  };
}
