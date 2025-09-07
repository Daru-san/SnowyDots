{
  inputs,
  pkgs,
  lib,
  ...
}:
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
    image =
      let
        path = inputs.walls + "/images/caidychen_original_characters_anime_girls.png";
        brightness = 0;
        fillColor = "black";
      in
      pkgs.runCommand "dimmed-background.png" { } ''
        ${lib.getExe' pkgs.imagemagick "magick"} "${path}" -brightness-contrast ${toString brightness} -fill ${fillColor} $out
      '';

    imageScalingMode = "stretch";
    opacity = {
      terminal = 0.7;
    };
    polarity = "dark";
  };
}
