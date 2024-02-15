{
  lib,
  stdenv,
  fetchFromGitHub,
  pkg-config,
  gtk3,
  meson,
  ninja,
  libconfig,
  gtk-layer-shell,
  gobject-introspection,
}:
stdenv.mkDerivation rec {
  pname = "tschuss";
  version = "6ee14d8";

  src = fetchFromGitHub {
    owner = "Lucad44";
    repo = pname;
    rev = "6ee14d8dfaa64b9b1f70cc6c4856c348ac10f5ee";
    hash = "sha256-jfl8JcWq6dvKwGR19vXNwzUGB/GAnftqGVDECBRIjvE=";
  };

  nativeBuildInputs = [pkg-config ninja meson];

  buildInputs = [gtk3 gtk-layer-shell libconfig gobject-introspection];

  hardeningDisable = ["format"];

  makeFlags = ["PREFIX=$(out)"];

  meta = with lib; {
    description = "Simple and fast highly customisable dropdown power menu for Linux systems.";
    homepage = "https://github.com/Lucad44/tschuss";
    license = licenses.mit;
    maintainers = with maintainers; [daru];
    platforms = platforms.linux;
  };
}
