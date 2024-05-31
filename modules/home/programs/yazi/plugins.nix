let
  yazi-plugins = import ./nix/sources.nix;
  getPlugin = x: yazi-plugins.${x}.outPath;
in {
  programs.yazi.flavors.tokyonight = "tokyo-night.yazi";
  programs.yazi.plugins = {
    smart-enter = ./smart-enter;
    exifaudio = getPlugin "exifaudio.yazi";
    glow = getPlugin "glow.yazi";
    mime = getPlugin "mime.yazi";
    bat = getPlugin "yazi-plugin-bat";
    fg = getPlugin "fg.yazi";
    ouch = getPlugin "ouch.yazi";
    eza-preview = getPlugin "eza-preview.yazi";
    torrent-preview = getPlugin "torrent-preview.yazi";
  };
}
