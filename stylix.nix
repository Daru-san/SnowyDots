{
  pkgs,
  config,
  inputs,
  lib,
  ...
}:
let
  iconTheme =
    let
      whitesur-fix = pkgs.whitesur-icon-theme.overrideAttrs (oldAttrs: {
        postInstall = ''
          find -L $out -type l -print -delete
        '';
      });
    in
    {
      name = "WhiteSur-grey-dark";
      package = whitesur-fix.override {
        boldPanelIcons = true;
        alternativeIcons = true;
        themeVariants = [
          "grey"
        ];
      };
    };
in
{
  stylix = {
    enable = true;
    enableReleaseChecks = false;
    base16Scheme = "${inputs.tinted-themes}/base24/wryan.yaml";
    image =
      let
        path = inputs.walls + "/images/caidychen_original_characters_anime_girls_mono.png";
        brightness = -6;
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
    targets = {
      fontconfig.enable = true;
      font-packages.enable = true;
    };
    icons = {
      enable = true;
      dark = iconTheme.name;
      light = iconTheme.name;
      package = iconTheme.package;
    };
    cursor = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 26;
    };
    fonts = {
      serif = {
        package = pkgs.rubik;
        name = "Rubik";
      };
      sansSerif = config.stylix.fonts.serif;
      monospace = {
        package = pkgs.nerd-fonts.fantasque-sans-mono;
        name = "FantasqueSansM Nerd Font";
      };
      sizes = {
        desktop = 12;
        applications = 12;
        terminal = 14;
      };
    };
  };
}
