{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [./config];
  config = lib.mkIf config.wayland.windowManager.sway.enable {
    systemd.user.sessionVariables = config.home.sessionVariables;
    home.packages = with pkgs; [swaytools];
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
          "systemctl --user import-environment"
          "systemctl --user start polkit-gnome"
          "systemctl --user start xdg-desktop-portal-wlr"
          "systemctl --user start plasma-xdg-desktop-portal-kde"
        ];
      };
      wrapperFeatures = {gtk = true;};
      config = {
        terminal = lib.getExe config.programs.kitty.package;
        menu = lib.getExe config.programs.anyrun.package;
      };
    };
  };
}
