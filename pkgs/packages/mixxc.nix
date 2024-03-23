{
  lib,
  rustPlatform,
  fetchCrate,
  pkg-config,
  libpulseaudio,
  gtk4-layer-shell,
  gtk4,
  mold,
  clang,
  patchelf,
}:
rustPlatform.buildRustPackage rec {
  pname = "mixxc";
  version = "0.2.1";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-E/3lJR6xISegfclrBfxTkDBCWDEoIGjo2yWALpc0hdo=";
  };

  cargoHash = "sha256-dSn8mwXjs930w7qAkWrftbLqkldfciLZzfAkPLKNZrA=";

  cargoBuildFlags = ["--locked" "--features=Sass,Wayland"];

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    pkg-config
    libpulseaudio.dev
    gtk4-layer-shell.dev
    gtk4.dev
    mold
    patchelf
    clang
  ];

  meta = with lib; {
    description = "Mixxc is a minimalistic and customizable volume mixer, created to seamlessly complement desktop widgets.";
    homepage = "https://github.com/Elvyria/mixxc";
    license = with licenses; [mit];
    maintainers = with maintainers; [darumaka];
    mainProgram = "mixxc";
    platforms = platforms.linux;
  };
}
