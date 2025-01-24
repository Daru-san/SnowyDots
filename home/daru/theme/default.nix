{ inputs, ... }:
{
  imports =
    (with inputs; [
      niri.homeModules.stylix
      stylix.homeManagerModules.stylix
    ])
    ++ [
      ./qt.nix
      ./fonts.nix
      ./gtk.nix
    ];

  stylix = {
    enable = true;
    base16Scheme = "${inputs.tinted-themes}/base24/one-black.yaml";
    targets = {
      gtk.enable = false;
      spicetify.enable = false;
    };
    image = inputs.walls + "/images/leafy_canopy_by_pugnaciousone_de2skrr.png";
    imageScalingMode = "stretch";
    opacity = {
      terminal = 0.8;
    };
    polarity = "dark";
  };
}
