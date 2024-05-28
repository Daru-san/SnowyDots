{inputs, ...}: let
  yazi-plugins = inputs.yazi-plugins.inputs;
  getPlugin = x: yazi-plugins.${x};
  setPlugin = x: "yazi/plugins/${x}.yazi";
in {
  xdg.configFile = {
    "yazi/init.lua".source = ./lua/init.lua;
    "yazi/theme.toml".source = "${getPlugin "tokyo-night"}/flavor.toml";
    "${setPlugin "exifaudio"}".source = getPlugin "exifaudio";
    "${setPlugin "glow"}".source = getPlugin "glow";
    "${setPlugin "mime"}".source = getPlugin "mime";
    "${setPlugin "bat"}".source = getPlugin "bat";
    "${setPlugin "fg"}".source = getPlugin "fg";
    "${setPlugin "smart-enter"}/init.lua".source = ./lua/smart-enter.lua;
  };
}
