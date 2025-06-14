{ pkgs, ... }:
let
  yazi-plugins = import ./npins/default.nix;
  getPlugin = x: yazi-plugins.${x}.outPath;
in
{
  programs.yazi = {
    flavours = {
      vscode-dark-plus = getPlugin "vscode-dark-plus.yazi";
    };
    plugins = with pkgs.yaziPlugins; {
      inherit
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
