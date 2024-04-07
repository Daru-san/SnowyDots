{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.wayland.lockscreen.gtklock;
in
  with lib; {
    options.wayland.lockscreen.gtklock.enable = mkEnableOption "Enable gtklock lockscreen";
    config = mkIf cfg.enable {
      home.packages = [pkgs.gtklock];
      xdg.configFile = {
        "gtklock/config.ini".text = lib.generators.toINI {} {
          main = {
            start-hidden = true;
            idle-hide = true;
            modules = with pkgs;
              builtins.concatStringsSep ";" [
                "${gtklock-powerbar-module}/lib/gtklock/powerbar-module.so"
                "${gtklock-playerctl-module}/lib/gtklock/playerctl-module.so"
              ];
            background = toString config.wallpaperImage;
          };
        };
        "gtklock/style.css".text = builtins.readFile ./style.css;
      };
    };
  }
