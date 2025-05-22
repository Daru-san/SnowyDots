let
  yazi-plugins = import ./npins/default.nix;
  getPlugin = x: yazi-plugins.${x}.outPath;
in
{
  programs.yazi = {
    plugins = {
      "mdcat" = getPlugin "mdcat.yazi";
      "bat" = getPlugin "yazi-plugin-bat";
      "ouch" = getPlugin "ouch.yazi";
      "torrent-preview" = getPlugin "torrent-preview.yazi";
      "max-preview" = (getPlugin "plugins") + "/max-preview.yazi";
      "hide-preview" = (getPlugin "plugins") + "/hide-preview.yazi";
      "yatline" = getPlugin "yatline.yazi";
      "starship" = getPlugin "starship.yazi";
      "open-with-cmd" = getPlugin "open-with-cmd.yazi";
      "hexyl" = getPlugin "hexyl.yazi";
      "git" = (getPlugin "plugins") + "/git.yazi";
      "vcs-files" = (getPlugin "plugins") + "/vcs-files.yazi";
      "what-size" = getPlugin "what-size.yazi";
      "copy-file-contents" = (getPlugin "plugins-yazi") + "/copy-file-contents.yazi";
      "yatline-gruvbox-material" = getPlugin "yatline-gruvbox-material.yazi";
    };
  };
}
