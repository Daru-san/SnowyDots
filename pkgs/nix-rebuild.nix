
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
    version = "1.0";
    src = fetchFromGitHub {
      # https://github.com/Daru-san/Nix-Scripts
      owner = "Daru-san";
      repo = "Nix-Scripts";
      rev = "2cbd7128f92fed801b4b78fa8ba3a0d32e501170";
      sha256 = "MRWu4Kw3bCE7+fSGaPs1BntWuw2WhsfMBk28BVg3Cx4=";
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
