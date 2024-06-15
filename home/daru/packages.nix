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
      archiver
      oculante
      swayimg
      krita
      pwvucontrol
      libreoffice-qt-fresh
      prismlauncher
      blanket
      g4music
      kdePackages.kalzium

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
      obexftp
      obexfs
      hut
      unstable.nvtopPackages.intel
      sysz
      systemctl-tui
      exiftool
      xdg-utils
      pulsemixer
      maven
      transmission
      musikcube
      qmmp
      mediainfo
      unrar
      onefetch
      nix-output-monitor
      nix-init
      nix-update
      nixfmt-rfc-style
      zaread
      trashy
    ])
    (with pkgs.gnome; [dconf-editor gnome-clocks file-roller cheese])
    (with inputs; [
      r-pg.packages.${system}.default
      anipy-cli.packages.${system}.default
      color-picker.packages.${system}.default
      snowyvim.packages.${system}.neovim
    ])
  ];
}
