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
      obsidian
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
      ungoogled-chromium
      g4music
      mixxc
      kdePackages.kalzium
      ryujinx
      (retroarch.override {
        cores = with libretro; [
          citra
          melonds
        ];
      })

      # CLI
      ouch
      element
      swww
      niv
      tree
      tgpt
      dooit
      adbtuifm
      neovim
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
      nitch
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
    [
      inputs.r-pg.packages.${system}.default
      inputs.anipy-cli.packages.${system}.default
      inputs.color-picker.packages.${system}.default
    ]
  ];
}
