{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.wayland;
in
{
  options.wayland.enable = mkEnableOption "Enable wayland";
  imports = [ inputs.niri.nixosModules.niri ];
  config = mkIf cfg.enable {
    niri-flake = {
      cache.enable = true;
    };
    programs = {
      niri.enable = true;
      dconf.enable = true;
      seahorse.enable = true;
      file-roller.enable = true;
    };
    security.pam.services.hyprlock = { };
    services.greetd = {
      package = pkgs.greetd;
      enable = true;
      settings = rec {
        initial_session = {
          command =
            let
              flags = lib.cli.toGNUCommandLineShell { } {
                t = true;
                window-padding = 1;
                g = "Be the key to this door.";
                r = true;
              };
            in
            "${pkgs.greetd.tuigreet}/bin/tuigreet ${flags}";
          user = "daru";
        };
        default_session = initial_session;
      };
    };
  };
}
