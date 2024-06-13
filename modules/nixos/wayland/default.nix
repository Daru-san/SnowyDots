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
  config = mkIf cfg.enable {
    programs = {
      sway = {
        enable = true;
        extraPackages = [];
      };
      hyprland.enable = true;
    };
    services.gnome = {
      sushi.enable = true;
      gnome-user-share.enable = true;
    };
    security.pam.services.hyprlock = {};
    xdg.portal = {
      enable = lib.mkDefault true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
      ];
    };
    programs = {
      dconf.enable = true;
      hyprlock.enable = true;
      file-roller.enable = true;
    };
    services.greetd = {
      package = pkgs.greetd;
      enable = true;
      settings = rec {
        initial_session = {
          command = let
            flags = lib.cli.toGNUCommandLineShell {} {
              t = "";
              window-padding = 1;
              g = "Hello, Daru";
              c = "Hyprland";
              theme = lib.concatStringsSep ";" [
                "border=magenta"
                "text=gray"
                "prompt=green"
                "time=red"
                "action=blue"
                "button=yellow"
                "container=black"
                "input=red"
              ];
            };
          in "${pkgs.greetd.tuigreet}/bin/tuigreet ${flags}";
          user = "daru";
        };
        default_session = initial_session;
      };
    };
    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        after = ["graphical-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
  };
}
