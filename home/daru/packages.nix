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
      planify

      # Science
      kdePackages.kalzium
      element

      # Content creation
      kdePackages.kdenlive

      # Media
      ffmpeg
      oculante
      exiftool
      mdcat
      euphonica
      mediainfo
      musikcube
      pulsemixer

      # Desktop
      swww
      qownnotes

      # GUI Util
      cheese
      kdePackages.arc
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
      lz4
      android-tools
      wiki-tui
      mprocs

      grayjay

      blender

      (with kdePackages; [
        dolphin-plugins
        dolphin
        kio-fuse
        kio-gdrive
        kio-admin
      ])

      prismlauncher
    ])
    (with inputs; [
      # rimi.packages.${system}.default
      color-picker.packages.${system}.default
    ])
  ];
}
