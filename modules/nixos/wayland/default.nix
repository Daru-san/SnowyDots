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
  imports = [
    # ./polkit
    inputs.niri.nixosModules.default
  ];
  config = mkIf cfg.enable {
    niri-flake = {
      cache.enable = true;
    };
    programs = {
      niri.enable = true;
      hyprland.enable = false;
      dconf.enable = true;
      seahorse.enable = true;
      file-roller.enable = true;
    };
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
                g = "Access is restricted to authorized personnel only.";
                c = "niri";
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
