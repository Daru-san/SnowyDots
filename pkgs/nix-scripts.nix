
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
    version = "26d32e162e885f939559a97819a58213d5f49b26";
    src = fetchFromGitHub {
      # https://github.com/Daru-san/Nix-Scripts
      owner = "Daru-san";
      repo = "Nix-Scripts";
      rev = "26d32e162e885f939559a97819a58213d5f49b26";
      sha256 = "evwEVqwv3HvkT1DePaVnGzLspd+xBhQZY9Ao5BQurU0=";
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
