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
  installShellFiles,
  features ? ["X11" "Wayland" "Sass"],
}: let
  pname = "mixxc";
in
  lib.checkListOfEnum "${pname}: features" ["X11" "Wayland" "Sass"] features
  rustPlatform.buildRustPackage rec {
    inherit pname;
    version = "0.2.2";

    src = fetchCrate {
      inherit pname version;
      hash = "sha256-Y/9l8t6Vz7yq9T1AyoHnWmIcju1rfcV0S74hiK1fEjo=";
    };

    cargoHash = "sha256-l9inqqUiLObrqd/8pNobwBbLaiPJD39YK/38CWfDh+Q=";
    outputs = ["out" "man"];
    cargoBuildFlags = [
      "--locked"
      ("--features=" + builtins.concatStringsSep "," features)
    ];

    nativeBuildInputs = [pkg-config installShellFiles];

    buildInputs = [
      pkg-config
      libpulseaudio.dev
      gtk4-layer-shell.dev
      gtk4.dev
      mold
      patchelf
      clang
    ];
    postInstall = ''
      installManPage $src/doc/mixxc.1
    '';

    meta = with lib; {
      description = "Mixxc is a minimalistic and customizable volume mixer, created to seamlessly complement desktop widgets.";
      homepage = "https://github.com/Elvyria/mixxc";
      license = with licenses; [mit];
      maintainers = with maintainers; [daru-san];
      mainProgram = "mixxc";
      platforms = platforms.linux;
    };
  }
