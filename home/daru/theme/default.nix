{ inputs, ... }:
{
  imports =
    (with inputs; [
      stylix.homeModules.stylix
    ])
    ++ [
      ./qt.nix
      ./fonts.nix
      ./gtk.nix
    ];

  stylix = {
    enable = true;
    enableReleaseChecks = false;
    base16Scheme = "${inputs.tinted-themes}/base24/mountain.yaml"; # selenized-black qualia pop penumbra-dark pencil-dark operator-mono-dark base24/mountain.yaml material-vivid
    targets = {
      gtk.enable = false;
      spicetify.enable = false;
    };
    image = inputs.walls + "/images/caidychen_original_characters_anime_girls.png"; # butterfly.png
    imageScalingMode = "stretch";
    opacity = {
      terminal = 0.8;
    };
    polarity = "dark";
  };
}
