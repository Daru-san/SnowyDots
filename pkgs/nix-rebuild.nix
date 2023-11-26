
{
  pkgs ? import <nixpkgs> { system = builtins.currentSystem; }
, stdenv ? pkgs.stdenv
, lib ? pkgs.lib
, fetchFromGitHub ? pkgs.fetchFromGitHub
, bash ? pkgs.bash
, subversion ? pkgs.subversion
, makeWrapper ? pkgs.makeWrapper
}:
  stdenv.mkDerivation {
    pname = "nix-rebuild";
    version = "1.3";
    src = fetchFromGitHub {
      # https://github.com/Daru-san/Nix-Scripts
      owner = "Daru-san";
      repo = "Nix-Scripts";
      rev = "9946ce52af751a0eb3242b0d5c66d9eec7749d25";
      sha256 = "dq1ug1wX6f8d/KDMnsDqF8I+i1dWLnYLfHrR31F+7us=";
    };
    buildInputs = [ bash subversion ];
    nativeBuildInputs = [ makeWrapper ];
    installPhase = ''
      mkdir -p $out/bin
      cp $src/scripts/nix-rebuild.sh $out/bin/nix-rebuild
      wrapProgram $out/bin/nix-rebuild \
        --prefix PATH : ${lib.makeBinPath [ bash subversion ]}
    '';
  }
