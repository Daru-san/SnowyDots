{
  pkgs,
  config,
  lib,
  ...
}:
{
  imports = [ ./config ];
  config = lib.mkIf config.wayland.windowManager.sway.enable {
    systemd.user.sessionVariables = config.home.sessionVariables;
    home.packages = with pkgs; [ swaytools ];
    wayland.windowManager.sway = {
      checkConfig = false;
      package = pkgs.swayfx;
      systemd = {
        enable = true;
        xdgAutostart = true;
        extraCommands = [
          "systemctl --user start easyeffects"
          "systemctl --user start hypridle"
          "systemctl --user start swayosd"
          "systemctl --user start wlsunset"
          "systemctl --user start flameshot"
          "systemctl --user start waybar"
        ];
      };
      wrapperFeatures = {
        gtk = true;
      };
      config = {
        terminal = lib.getExe config.programs.ghostty.package;
        menu = lib.getExe config.programs.anyrun.package;
      };
    };
  };
}
