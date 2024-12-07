{ config, inputs, ... }:
{
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      recolor-keephue = true;
      font = "${config.fonts.monospace.name} ${toString config.fonts.sizes.terminal}";
      page-padding = 3;
      selection-notification = false;
      scroll-page-aware = true;
      guioptions = "none";
      statusbar-home-tilde = true;
      window-title-basename = true;
    };
    mappings = {
      "<C-c>" = "set selection-clipboard clipboard";
      "<C-v>" = "set selection-clipboard primary";
    };
    extraConfig = builtins.readFile (config.scheme inputs.base16-zathura);
  };
}
