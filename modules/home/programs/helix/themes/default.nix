{ lib, ... }:
let
  themes = import ./npins/default.nix;
in
{
  aegir = builtins.readFile "${themes.aegir.outPath}/themes/aegir";
  aegir_transparent = builtins.readFile "${themes.aegir.outPath}/themes/aegir_transparent.toml";
  darkvoid = builtins.readFile "${themes.darkvoid.outPath}/darkvoid.toml";
  grayscale = builtins.readFile "${themes.grayscale.outPath}/themes/grayscale.toml";
  oxocarbon = builtins.readFile "${themes.oxocarbon.outPath}/oxocarbon.toml";
  rose_pine = builtins.readFile "${themes.rose-pine.outPath}/rose_pine.toml";
  rose_pine_dawm = builtins.readFile "${themes.rose-pine.outPath}/rose_pine_dawn.toml";
  rose_pine_moon = builtins.readFile "${themes.rose-pine.outPath}/rose_pine_moon.toml";
}
