let
  yazi-plugins = import ./nix/sources.nix;
  getPlugin = x: yazi-plugins.${x}.outPath;
  setPlugin = x: "yazi/plugins/${x}.yazi";
in {
  xdg.configFile = {
    "yazi/init.lua".source = ./lua/init.lua;
    "yazi/theme.toml".source = "${getPlugin "tokyo-night.yazi"}/flavor.toml";
    "${setPlugin "smart-enter"}/init.lua".source = ./lua/smart-enter.lua;
    ${setPlugin "exifaudio"}.source = getPlugin "exifaudio.yazi";
    ${setPlugin "glow"}.source = getPlugin "glow.yazi";
    ${setPlugin "mime"}.source = getPlugin "mime.yazi";
    ${setPlugin "bat"}.source = getPlugin "yazi-plugin-bat";
    ${setPlugin "fg"}.source = getPlugin "fg.yazi";
    ${setPlugin "ouch"}.source = getPlugin "ouch.yazi";
    ${setPlugin "eza-preview"}.source = getPlugin "eza-preview.yazi";
    ${setPlugin "torrent-preview"}.source = getPlugin "torrent-preview.yazi";
  };
}
