{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [swaynotificationcenter];
  xdg.configFile."swaync/config.json".text = (builtins.readFile ./config.json);
  xdg.configFile."swaync/style.css".text = (builtins.readFile ./style.css);
}
