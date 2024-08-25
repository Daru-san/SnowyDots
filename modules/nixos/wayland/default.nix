{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.wayland;
in {
  options.wayland.enable = mkEnableOption "Enable wayland";
  imports = [./polkit];
  config = mkIf cfg.enable {
    programs.sway = {
      enable = true;
      extraPackages = [];
      package = pkgs.swayfx;
    };
    programs = {
      dconf.enable = true;
      seahorse.enable = true;
      file-roller.enable = true;
    };
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-kde
      ];
      config = {
        sway = {
          default = [
            "wlr"
            "gtk"
          ];
          "org.freedesktop.impl.portal.FileChooser" = ["kde"];
          "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
        };
      };
    };
    services.greetd = {
      package = pkgs.greetd;
      enable = true;
      settings = rec {
        initial_session = {
          command = let
            flags = lib.cli.toGNUCommandLineShell {} {
              t = true;
              window-padding = 1;
              g = "Access is restricted to authorized personnel only.";
              c = "sway";
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
