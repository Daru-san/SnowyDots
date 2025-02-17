let
  yazi-plugins = import ./npins/default.nix;
  getPlugin = x: yazi-plugins.${x}.outPath;
in
{
  programs.yazi.plugins = {
    "smart-enter" = ./smart-enter;
    "glow" = getPlugin "glow.yazi";
    "bat" = getPlugin "yazi-plugin-bat";
    "fg" = getPlugin "fg.yazi";
    "ouch" = getPlugin "ouch.yazi";
    "torrent-preview" = getPlugin "torrent-preview.yazi";
    "full-border" = (getPlugin "plugins") + "/full-border.yazi";
    "max-preview" = (getPlugin "plugins") + "/max-preview.yazi";
    "hide-preview" = (getPlugin "plugins") + "/hide-preview.yazi";
    "yatline" = getPlugin "yatline.yazi";
    "starship" = getPlugin "starship.yazi";
    "open-with-cmd" = getPlugin "open-with-cmd.yazi";
    "hexyl" = getPlugin "hexyl.yazi";
    "git" = (getPlugin "plugins") + "/git.yazi";
    "what-size" = getPlugin "what-size.yazi";
    "clipboard" = getPlugin "clipboard.yazi";
    "yatline-tokyo-night" = getPlugin "yatline-tokyo-night.yazi";
  };
}
