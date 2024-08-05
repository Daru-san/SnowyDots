let
  yazi-plugins = import ./npins/default.nix;
  getPlugin = x: yazi-plugins.${x}.outPath;
in {
  programs.yazi.flavors = {
    "tokyo-night" = getPlugin "tokyo-night.yazi";
  };
  programs.yazi.plugins = {
    "smart-enter" = ./smart-enter;
    "exifaudio" = getPlugin "exifaudio.yazi";
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
  };
}
