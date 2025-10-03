{ lib, ... }:
let
  themes = import ./npins/default.nix;
in
{
  aegir = builtins.toPath "${themes.aegir.outPath}/themes/aegir";
  aegir_transparent = builtins.toPath "${themes.aegir.outPath}/themes/aegir_transparent.toml";
  darkvoid =  builtins.toPath "${themes.darkvoid.outPath}/darkvoid.toml";
  grayscale = builtins.toPath "${themes.grayscale.outPath}/themes/grayscale.toml";
  oxocarbon =  builtins.toPath "${themes.oxocarbon.outPath}/oxocarbon.toml";
  rose_pine =  builtins.toPath  "${themes.rose-pine.outPath}/rose_pine.toml";
  rose_pine_dawm = builtins.toPath "${themes.rose-pine.outPath}/rose_pine_dawn.toml";
  rose_pine_moon = builtins.toPath "${themes.rose-pine.outPath}/rose_pine_moon.toml";
}
