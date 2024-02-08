{
  pkgs
, lib
, config
, ...
}:
{
  home.packages = with pkgs; [gtklock];
  xdg.configFile = {
    "gtklock/config.ini".text = with lib; generators.toINI {} {
      main = {
        start-hidden = true;
        idle-hide = true;
        modules = "${pkgs.gtklock-powerbar-module}/lib/gtklock/powerbar-module.so;${pkgs.gtklock-playerctl-module}/lib/gtklock/playerctl-module.so";
        background = "${config.theme.wallpaper.image}";
      };
    };
    "gtklock/style.css".text = (builtins.readFile ./style.css);
  };
}
