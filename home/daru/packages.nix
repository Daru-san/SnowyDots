# Home packages shared between users
{
  pkgs,
  inputs,
  system,
  lib,
  ...
}: {
  home.packages = lib.mkMerge [
    (with pkgs; [
      # GUI
      scrcpy
      keepassxc
      bridge-editor
      oculante
      pwvucontrol
      gnome.gnome-software
      blanket
      mission-center
      g4music
      stable.kdePackages.kalzium
      prismlauncher
      lazarus-qt

      ryujinx
      lime3ds
      mgba
      melonDS
      yoke

      # CLI
      ouch
      element
      swww
      niv
      tree
      tgpt
      dooit
      adbtuifm
      libnotify
      fd
      speedtest-cli
      glow
      gping
      hut
      unstable.nvtopPackages.intel
      sysz
      systemctl-tui
      exiftool
      xdg-utils
      pulsemixer
      maven
      musikcube
      qmmp
      mediainfo
      unrar
      onefetch
      nix-output-monitor
      nix-init
      nix-update
      nixfmt-rfc-style
      trashy
      turtle
      rqbit
      dconf-editor
      file-roller
      cheese
    ])
    (with pkgs.gnome; [gnome-clocks])
    (with inputs; [
      r-pg.packages.${system}.default
      anipy-cli.packages.${system}.default
      color-picker.packages.${system}.default
      snowyvim.packages.${system}.neovim
    ])
  ];
}
