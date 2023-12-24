{
  stdenv
, lib
, fetchFromGitHub
, bash
, subversion
, makeWrapper
, hyprpicker
, libnotify
, wl-clipboard
}:
  stdenv.mkDerivation {
    pname = "nix-scripts";
    version = "1ef56b";
    src = fetchFromGitHub {
      # https://github.com/Daru-san/Nix-Scripts
      owner = "Daru-san";
      repo = "Nix-Scripts";
      rev = "1ef56b4f1397f366793aec5aed0808d56d9e751d";
      sha256 = "d1ETmMifinle6/V61fev11Kwr45rxv4yNKR8I4TiK5Q=";
    };
    buildInputs = [ bash subversion ];
    nativeBuildInputs = [ makeWrapper ];
    installPhase = ''
      mkdir -p $out/bin
      cp $src/scripts/nix-rebuild.sh $out/bin/nix-rebuild
      cp $src/scripts/hm-build.sh $out/bin/hm-build
      cp $src/scripts/color-picker.sh $out/bin/color-picker 

      wrapProgram $out/bin/nix-rebuild \
        --prefix PATH : ${lib.makeBinPath [ bash subversion ]}
      wrapProgram $out/bin/hm-build \
        --prefix PATH : ${lib.makeBinPath [ bash subversion ]}
       wrapProgram $out/bin/color-picker \
        --prefix PATH : ${lib.makeBinPath [ bash subversion hyprpicker libnotify wl-clipboard ]}     
    '';
  }
