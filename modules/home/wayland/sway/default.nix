{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.wayland.compositor;
in
  with lib; {
    imports = [
      ./config
      ./fuzzel
      ./gtklock
      ./alacritty
    ];
    config = mkIf (cfg == "sway") {
      services = let
        systemdTarget = "sway-session.target";
      in {
        wlsunset = {inherit systemdTarget;};
        kanshi = {inherit systemdTarget;};
        swaync = {inherit systemdTarget;};
      };
      wayland = {
        launcher.fuzzel.enable = true;
        lockscreen.gtklock.enable = true;
        terminal.alacritty.enable = true;
        windowManager.sway = {
          package = pkgs.swayfx;
          systemd = {enable = true;};
          wrapperFeatures = {gtk = true;};
          config = {
            terminal = getExe config.programs.alacritty.package;
            menu = getExe config.programs.fuzzel.package;
          };
        };
      };
    };
  }
