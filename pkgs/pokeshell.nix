{
  pkgs ? import <nixpkgs> { system = builtins.currentSystem; }
, stdenv ? pkgs.stdenv
, lib ? pkgs.lib
, fetchFromGitHub ? pkgs.fetchFromGitHub
, bash ? pkgs.bash
, jq ? pkgs.jq
, imagemagick ? pkgs.imagemagick
, chafa ? pkgs.chafa
, subversion ? pkgs.subversion
, makeWrapper ? pkgs.makeWrapper
}:
  stdenv.mkDerivation {
    pname = "pokeshell";
    version = "1.0.0";
    src = fetchFromGitHub {
      owner = "acxz";
      repo = "pokeshell";
      rev = "75e2304ae2f56ba9f94076d4368a0e9e76aa0135";
      sha256 = "SdVACIVS36pgdd9rXJUtql+spLIzQVz5ikRGMRvPZqc=";
    };
    buildInputs = [ bash subversion jq chafa imagemagick];
    nativeBuildInputs = [ makeWrapper ];
    installPhase = ''
      mkdir -pv $out/local/bin

      cp -rv $src/bin $out/local
      cp -rv $src/share $out/local
      
      wrapProgram $out/local/bin/pokeshell \
        --prefix PATH : ${lib.makeBinPath [ bash subversion jq chafa imagemagick ]}
    '';
  }
