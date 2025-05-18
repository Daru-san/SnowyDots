# Home packages shared between users
{
  pkgs,
  inputs,
  system,
  lib,
  ...
}:
{
  home.packages = lib.mkMerge [
    (with pkgs; [
      # GUI
      scrcpy
      aria2
      seanime
      nextcloud-client
      stable.planify

      # Science
      kdePackages.kalzium
      element
      celestia

      # Content creation
      kdePackages.kdenlive

      # Media
      ffmpeg
      oculante
      exiftool
      mdcat
      g4music
      lua
      mediainfo
      musikcube
      pulsemixer

      # Developmentment
      hut
      codeberg-cli
      vala
      rustc
      clang
      zig
      jq
      license-go
      yq-go
      gdb
      seer
      valgrind
      xmake
      go
      woodpecker-cli
      rustup
      git-repo

      # Desktop
      swww
      ayugram-desktop
      qownnotes

      # GUI Util
      file-roller
      cheese
      stable.varia

      # Android
      adbtuifm
      waydroid-script

      # Documents
      pandoc
      glow
      texliveSmall
      libreoffice-qt6-fresh

      # System monitoring
      gping
      speedtest-cli
      sysz
      nvtopPackages.intel
      systemctl-tui

      # Nix
      nix-init
      npins
      nix-output-monitor
      nix-update
      nixfmt-rfc-style

      # CLI
      spotdl
      ouch
      tree
      tgpt
      libnotify
      fd
      xdg-utils
      unrar
      onefetch
      gtrash
      rqbit
      dconf-editor
      hexyl
      xdg-user-dirs
      tealdeer
      aichat
      lz4
      android-tools

      # The craft
      prismlauncher

      (retroarch.withCores (
        cores: with cores; [
          citra
          melonds
          mgba
        ]
      ))
    ])
    (with inputs; [
      # rimi.packages.${system}.default
      color-picker.packages.${system}.default
    ])
  ];
}
