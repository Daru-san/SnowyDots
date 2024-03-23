{
  lib,
  stdenv,
  fetchFromGitHub,
  zathura,
  makeWrapper,
  libreoffice,
  typst,
  bash,
}:
stdenv.mkDerivation {
  pname = "zaread";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "paoloap";
    repo = "zaread";
    rev = "c2d45e1bbaeb0a637b1747cc89b483f2c6d11cb3";
    hash = "sha256-g4Xb6gGA09/rfv0myzHbc830BwtD37IOYuEIwoOigP8=";
  };

  nativeBuildInputs = [makeWrapper];

  hardeningDisable = ["format"];

  buildPhase = ''
    mkdir -p $out/bin

    cp $src/zaread $out/bin/zaread
  '';

  installPhase = ''
    wrapProgram $out/bin/zaread \
      --prefix PATH : ${
      lib.makeBinPath [bash zathura libreoffice typst]
    }  '';

  makeFlags = ["PREFIX=$(out)"];

  meta = with lib; {
    description = "A (very) lightweight ebook and Office document reader";
    homepage = "https://github.com/paoloap/zaread";
    license = licenses.gpl3Plus;
    mainProgram = "zaread";
    maintainers = with maintainers; [daru];
    platforms = platforms.linux;
  };
}
