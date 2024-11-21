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

      # Science
      kdePackages.kalzium
      element

      # Content creation
      krita
      kdenlive
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

      # Developmentment
      hut
      rustc
      clang

      # Desktop
      swww

      # GUI Util
      file-roller
      cheese

      # Android
      adbtuifm
      qtscrcpy
      waydroid-script

      # Documents
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
      spotdl
      ouch
      tree
      tgpt
      libnotify
      fd
      xdg-utils
      unrar
      onefetch
      trashy
      turtle
      rqbit
      dconf-editor
      hexyl
      xdg-user-dirs

      # The craft
      prismlauncher
    ])
    (with inputs; [
      rimi.packages.${system}.default
      anipy-cli.packages.${system}.default
      color-picker.packages.${system}.default
      snowyvim.packages.${system}.neovim
      timed-rs.packages.${system}.default
      ayugram.packages.${system}.ayugram-desktop
    ])
  ];
}
