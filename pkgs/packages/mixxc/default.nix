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
  features ? [],
}: let
  pname = "mixxc";
in
  lib.checkListOfEnum "${pname}: features" ["All" "X11" "Wayland" "Sassc"] features
  rustPlatform.buildRustPackage rec {
    inherit pname;
    version = "0.2.2";

    src = fetchCrate {
      inherit pname version;
      hash = "";
    };

    cargoHash = "";
    outputs = ["out" "man"];
    cargoBuildFlags = [
      "--locked"
      (lib.optionalString (features != []) "--features=" + builtins.concatStringsSep "," features)
    ];

    nativeBuildInputs = [installShellFiles];

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
      maintainers = with maintainers; [daru];
      mainProgram = "mixxc";
      platforms = platforms.linux;
    };
  }
