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

      # Science
      kdePackages.kalzium
      element

      # Content creation
      krita
      kdenlive

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

      # Developmentment
      android-studio
      bridge-editor
      hut
      maven

      # Desktop
      swww

      # GUI Util
      file-roller
      cheese

      # Android
      adbtuifm
      waydroid-script

      # Documents
      libreoffice-qt6-fresh
      pandoc
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
      nixfmt-rfc-style

      # CLI
      jq
      ouch
      tree
      tgpt
      libnotify
      fd
      xdg-utils
      unrar
      onefetch
      trashy
      stable.turtle
      rqbit
      dconf-editor
      hexyl
      xdg-user-dirs
    ])
    (with inputs; [
      r-pg.packages.${system}.default
      anipy-cli.packages.${system}.default
      color-picker.packages.${system}.default
      snowyvim.packages.${system}.neovim
      timed-rs.packages.${system}.default
    ])
  ];
}
