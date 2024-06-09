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
    wayland.windowManager.sway = {
      enable = true;
      checkConfig = false;
      package = pkgs.swayfx;
      systemd = {
        enable = true;
        extraCommands = [
          "systemctl --user start easyeffects.service"
          "systemctl --user start hypridle.service"
          "systemctl --user start swayosd.service"
          "systemctl --user start wlsunset.service"
          "systemctl --user start hyprpaper"
          "systemctl --user start polkit-gnome-authentication-agent-1"
        ];
      };
      wrapperFeatures = {gtk = true;};
      config = {
        terminal = lib.getExe config.programs.kitty.package;
        menu = lib.getExe config.programs.fuzzel.package;
      };
    };
  };
}
