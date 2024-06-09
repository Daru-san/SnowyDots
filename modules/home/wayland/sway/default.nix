{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [./config];
  config = {
    services = let
      systemdTarget = "sway-session.target";
    in {
      wlsunset = {inherit systemdTarget;};
      kanshi = {inherit systemdTarget;};
    };
    programs = {
      kitty.enable = true;
      fuzzel.enable = true;
    };
    wayland.windowManager.sway = {
      enable = true;
      checkConfig = false;
      package = pkgs.swayfx;
      systemd = {enable = true;};
      wrapperFeatures = {gtk = true;};
      config = {
        terminal = lib.getExe config.programs.kitty.package;
        menu = lib.getExe config.programs.fuzzel.package;
      };
    };
  };
}
