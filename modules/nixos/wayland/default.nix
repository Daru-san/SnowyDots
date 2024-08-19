{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.wayland.hyprland;
in {
  options.wayland.hyprland.enable = mkEnableOption "Enable wayland";
  imports = [./polkit ./plasma.nix];
  config = mkIf cfg.enable {
    programs = {
      sway.enable = false;
      sway.extraPackages = [];
      hyprland.enable = false;
      dconf.enable = true;
      seahorse.enable = true;
      file-roller.enable = false;
    };
    services.greetd = {
      package = pkgs.greetd;
      enable = false;
      settings = rec {
        initial_session = {
          command = let
            flags = lib.cli.toGNUCommandLineShell {} {
              t = true;
              window-padding = 1;
              g = "Access is restricted to authorized personnel only.";
              c = "Hyprland";
              r = true;
            };
          in "${pkgs.greetd.tuigreet}/bin/tuigreet ${flags}";
          user = "daru";
        };
        default_session = initial_session;
      };
    };
  };
}
