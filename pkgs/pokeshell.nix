{
  stdenv,
  lib,
  fetchFromGitHub,
  bash,
  jq,
  imagemagick,
  chafa,
  subversion,
  makeWrapper,
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
  buildInputs = [bash subversion jq chafa imagemagick];
  nativeBuildInputs = [makeWrapper];
  installPhase = ''
    mkdir -pv $out/bin

    cp -rv $src/bin/pokeshell $out/bin/pokeshell
    cp -rv $src/share $out

    wrapProgram $out/bin/pokeshell \
      --prefix PATH : ${
      lib.makeBinPath [bash subversion jq chafa imagemagick]
    }
  '';
}
