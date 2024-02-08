{
  pkgs
, lib
, ...
}:
{
  home.packages = with pkgs; [gtklock];
  xdg.configFile = {
    "gtklock/config.ini".text = lib.generators.toIni {} {
      main = {
        start-hidden = true;
        idle-hide = true;
        modules = [
          "${pkgs.gtklock-powerbar-module}/lib/gtklock/powerbar-module.so"
          "${pkgs.gtklock-playerctl-module}/lib/gtklock/playerctl-module.so"
        ];
        background = "${config.wallpaper}";
      };
    };
    "gtklock/style.css".text = (builtins.readFile ./style.css);
  };
}
