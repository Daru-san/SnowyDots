{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.wayland;
in
{
  options.wayland.enable = mkEnableOption "Enable wayland";
  config = mkIf cfg.enable {
    programs = {
      dconf.enable = true;
      seahorse.enable = true;
      niri.enable = true;
      weylus = {
        enable = true;
        users = ["daru"];
        openFirewall = true;
      };
      hyprland = {
        enable = false;
      };
    };
    security.pam.services.hyprlock = { };
    security.soteria.enable = true;
    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command =
            let
              flags = lib.cli.toCommandLineShellGNU { } {
                t = true;
                window-padding = 1;
                g = "Be the key to this door.";
                r = true;
              };
            in
            "${pkgs.tuigreet}/bin/tuigreet ${flags}";
          user = "daru";
        };
        default_session = initial_session;
      };
    };
  };
}
