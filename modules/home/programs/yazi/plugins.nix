{ pkgs, ... }:
let
  yazi-plugins = import ./npins/default.nix;
  getPlugin = x: yazi-plugins.${x}.outPath;
in
{
  programs.yazi = {
    plugins = {
      inherit (pkgs.yaziPlugins)
        git
        rsync
        mount
        yatline
        starship
        restore
        ouch
        yatline-catppuccin
        vcs-files
        piper
        mime-ext
        chmod
        ;
      "torrent-preview" = getPlugin "torrent-preview.yazi";
      "max-preview" = (getPlugin "plugins") + "/max-preview.yazi";
      "hide-preview" = (getPlugin "plugins") + "/hide-preview.yazi";
      "what-size" = getPlugin "what-size.yazi";
      "fr" = getPlugin "fr.yazi";
    };
  };
}
