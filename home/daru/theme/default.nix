{ inputs, ... }:
{
  imports =
    [ inputs.stylix.homeManagerModules.stylix ]
    ++ [
      ./qt.nix
      ./fonts.nix
      ./gtk.nix
    ];

  stylix = {
    enable = true;
    base16Scheme = "${inputs.tinted-themes}/base16/tokyodark-terminal.yaml";
    targets = {
      gtk.enable = false;
      spicetify.enable = false;
    };
    image = inputs.walls + "/images/dark-leaves.png";
    opacity = {
      terminal = 0.4;
    };
    polarity = "dark";
  };
}
