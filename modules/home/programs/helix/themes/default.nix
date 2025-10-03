{ lib, ... }:
let
  themes = import ./npins/default.nix;
in
{
  aegir = "${themes.aegir.outPath}/themes/aegir";
  aegir_transparent = "${themes.aegir.outPath}/themes/aegir_transparent.toml";
  darkvoid = "${themes.darkvoid.outPath}/darkvoid.toml";
  grayscale = "${themes.grayscale.outPath}/themes/grayscale.toml";
  oxocarbon = "${themes.oxocarbon.outPath}/oxocarbon.toml";
  rose_pine = "${themes.rose-pine.outPath}/rose_pine.toml";
  rose_pine_dawm = "${themes.rose-pine.outPath}/rose_pine_dawn.toml";
  rose_pine_moon = "${themes.rose-pine.outPath}/rose_pine_moon.toml";
}
