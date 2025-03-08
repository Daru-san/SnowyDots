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
      keepassxc
      obsidian
      vesktop
      aria2

      # Science
      kdePackages.kalzium
      element
      celestia

      # Content creation
      kdePackages.kdenlive
      gimp

      # Media
      ffmpeg
      oculante
      exiftool
      g4music
      qmmp
      pwvucontrol
      mediainfo
      musikcube
      pulsemixer
      stackpkgs.audiorelay

      # Developmentment
      hut
      codeberg-cli
      rustc
      clang
      zig
      jq
      license-go
      yq-go
      gdb
      seer
      valgrind

      # Desktop
      swww
      ayugram-desktop

      # GUI Util
      file-roller
      cheese
      varia

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

      # The craft
      prismlauncher
    ])
    (with inputs; [
      rimi.packages.${system}.default
      color-picker.packages.${system}.default
    ])
  ];
}
