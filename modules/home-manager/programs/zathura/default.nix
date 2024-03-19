{
  config,
  pkgs,
  ...
}: {
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      recolor-keephue = true;
      default-bg = "rgba(255,255,255,0)";
      recolor-lightcolor = "rgba(255,255,255,0)";
      recolor-darkcolor = "black";
      font = "${config.fonts.monospace.name} ${toString config.fonts.sizes.terminal}";
      page-padding = 3;
      selection-notification = true;
      selection-clipboard = "clipboard";
      scroll-page-aware = true;
      guioptions = "none";
      sandbox = "strict";
      statusbar-home-tilde = true;
      window-title-basename = true;
    };
    extraConfig =
      builtins.readFile pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "zathura";
        rev = "1bda9d8274dd327b7931886ef0c5c1eb33903814";
        hash = "sha256-HWOc5tnVgU/HUcVcIXACeuu3RDH1pHO/8DQRsWqumIA=";
      }
      + "/src/catpuccin-mocha";
  };
}
