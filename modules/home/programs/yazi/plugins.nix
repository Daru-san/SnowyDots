let
  yazi-plugins = import ./nix/sources.nix;
  getPlugin = x: yazi-plugins.${x}.outPath;
in {
  programs.yazi.flavors = {
    "tokyo-night.yazi" = getPlugin "tokyo-night.yazi";
  };
  programs.yazi.plugins = {
    "smart-enter.yazi" = ./smart-enter;
    "exifaudio.yazi" = getPlugin "exifaudio.yazi";
    "glow.yazi" = getPlugin "glow.yazi";
    "mime.yazi" = getPlugin "mime.yazi";
    "bat.yazi" = getPlugin "yazi-plugin-bat";
    "fg.yazi" = getPlugin "fg.yazi";
    "ouch.yazi" = getPlugin "ouch.yazi";
    "eza-preview.yazi" = getPlugin "eza-preview.yazi";
    "torrent-preview.yazi" = getPlugin "torrent-preview.yazi";
  };
}
