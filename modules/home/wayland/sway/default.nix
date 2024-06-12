{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [./config];
  home.packages = with pkgs; [swaytools];
  wayland.windowManager.sway = {
    checkConfig = false;
    package = pkgs.swayfx;
    systemd = {
      enable = true;
      extraCommands = [
        "systemctl --user start easyeffects"
        "systemctl --user start hypridle"
        "systemctl --user start swayosd"
        "systemctl --user start swaync"
        "systemctl --user start wlsunset"
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
}
