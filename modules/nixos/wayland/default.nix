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
  imports = [ ./polkit ];
  config = mkIf cfg.enable {
    programs.sway = {
      enable = false;
      extraPackages = [ ];
      package = pkgs.swayfx;
    };
    programs = {
      hyprland.enable = true;
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
                c = "Hyprland";
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
