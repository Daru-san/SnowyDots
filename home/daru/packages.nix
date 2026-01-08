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
      nextcloud-client
      element
      emblem
      elastic
      d-spy
      sysprof
      zapzap

      # Media
      ffmpeg
      oculante
      exiftool
      mdcat
      euphonica
      mediainfo
      musikcube
      gdu
      pulsemixer
      audacity

      # Desktop
      swww
      qownnotes

      # GUI Util
      cheese

      # Android
      adbtuifm

      # Documents
      glow

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
      nixfmt

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
      dconf-editor
      hexyl
      xdg-user-dirs
      tealdeer
      aichat
      lz4
      android-tools
      wiki-tui
      mprocs
      authenticator

      prismlauncher
    ])
    (with pkgs.kdePackages; [
      kdenlive
      kalzium
      dolphin-plugins
      ark
      dolphin
      kio-fuse
      kio-gdrive
      kio-admin
    ])
    (with inputs; [
      # rimi.packages.${system}.default
      color-picker.packages.${system}.default
    ])
  ];
}
