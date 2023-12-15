
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
    pname = "nix-scripts";
    version = "6d4d4464177e591b6a98cc376e57a482a2d89f7b";
    src = fetchFromGitHub {
      # https://github.com/Daru-san/Nix-Scripts
      owner = "Daru-san";
      repo = "Nix-Scripts";
      rev = "6d4d4464177e591b6a98cc376e57a482a2d89f7b";
      sha256 = "njXFWWNy171OspRPpiPtszLhRyx1FvLO9Gu5WjrDhM4=";
    };
    buildInputs = [ bash subversion ];
    nativeBuildInputs = [ makeWrapper ];
    installPhase = ''
      mkdir -p $out/bin
      cp $src/scripts/nix-rebuild.sh $out/bin/nix-rebuild
      cp $src/scripts/hm-build.sh $out/bin/hm-build
      wrapProgram $out/bin/nix-rebuild \
        --prefix PATH : ${lib.makeBinPath [ bash subversion ]}
      wrapProgram $out/bin/hm-build \
        --prefix PATH : ${lib.makeBinPath [ bash subversion ]}
   
    '';
  }
