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
      blanket
      mission-center
      g4music
      kdePackages.kalzium
      discover
      lazarus-qt
      kdenlive
      waydroid-script

      # CLI
      ouch
      element
      swww
      npins
      tree
      tgpt
      adbtuifm
      libnotify
      fd
      speedtest-cli
      glow
      gping
      hut
      nvtopPackages.intel
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
      stable.nix-init
      nix-update
      nixfmt-rfc-style
      trashy
      rqbit
      dconf-editor
      file-roller
      cheese
      mediainfo
      hexyl
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
