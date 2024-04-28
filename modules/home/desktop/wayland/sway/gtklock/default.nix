{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = [pkgs.gtklock];
  xdg.configFile = {
    "gtklock/config.ini".text = lib.generators.toINI {} {
      main = {
        start-hidden = true;
        idle-hide = true;
        modules = builtins.concatStringsSep ";" [
          "${pkgs.gtklock-powerbar-module}/lib/gtklock/powerbar-module.so"
          "${pkgs.gtklock-playerctl-module}/lib/gtklock/playerctl-module.so"
        ];
        background = toString config.wallpaperImage;
      };
    };
    "gtklock/style.css".text = builtins.readFile ./style.css;
  };
}
