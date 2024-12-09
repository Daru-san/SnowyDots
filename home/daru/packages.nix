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
      wike

      # Science
      kdePackages.kalzium
      element

      # Content creation
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
      stackpkgs.audiorelay

      # Developmentment
      hut
      rustc
      clang
      zig
      jq
      license-go
      yq-go
      gdb
      seer

      # Desktop
      swww

      # GUI Util
      file-roller
      cheese

      # Android
      adbtuifm
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
      tealdeer

      # The craft
      prismlauncher
      mangayomi
    ])
    (with inputs; [
      rimi.packages.${system}.default
      anipy-cli.packages.${system}.default
      color-picker.packages.${system}.default
      snowyvim.packages.${system}.neovim
      timed-rs.packages.${system}.default
    ])
  ];
}
