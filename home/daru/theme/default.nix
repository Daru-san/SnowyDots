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
    base16Scheme = "${inputs.tinted-themes}/base16/vesper.yaml";
    targets = {
      gtk.enable = false;
      spicetify.enable = false;
    };
    image = inputs.walls + "/images/dark-floral.png"; # butterfly.png
    imageScalingMode = "stretch";
    opacity = {
      terminal = 0.8;
    };
    polarity = "dark";
  };
}
