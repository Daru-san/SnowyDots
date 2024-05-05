{
  pkgs,
  stdenv,
  makeWrapper,
}:
stdenv.mkDerivation rec {
  pname = "gh-download";
  version = "0.6.1";
  src = pkgs.fetchFromGitHub {
    owner = "yuler";
    repo = "gh-download";
    rev = "v${version}";
    hash = "sha256-pMKVDJDhvzMlezhs7JpxrpljuRyW8Vz2rmwpAWLxXko=";
  };
  nativeBuildInputs = [makeWrapper];
  buildPhase = ''
    mkdir -p $out/bin
    cp $src/gh-download $out/bin/gh-download
  '';
  installPhase = ''
    wrapProgram $out/bin/gh-download'';
}
