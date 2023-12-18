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
      rev = "4c584741e988bd6b024b0369ebc6a883dc85363e";
      sha256 = "4LgXMg5wVG5d+YDBYwRZFAfD+1JJ0BpnyZJO+7TYD2A=";
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
