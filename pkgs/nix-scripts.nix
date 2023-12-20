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
    version = "4c58474";
    src = fetchFromGitHub {
      # https://github.com/Daru-san/Nix-Scripts
      owner = "Daru-san";
      repo = "Nix-Scripts";
      rev = "f62af1c0aee344b2d6461626f9865b416a1d8cec";
      sha256 = "dszy20B3W0c1EQH8FK+xKq1UbgkQ/BwlCg2eBAjyDO8=";
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
