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
      kdePackages.kalzium
      prismlauncher
      (symlinkJoin {
        name = "pascal-development";
        paths = [
          lazarus-qt
          fpc
          gnumake
          gcc
        ];
      })

      ryujinx
      lime3ds
      mgba
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
      rqbit
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
