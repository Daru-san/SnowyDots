# Home packages shared between users
{
  pkgs,
  system,
  inputs,
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
      newsflash
      archiver
      oculante
      swayimg
      pwvucontrol
      libreoffice-qt-fresh
      iwgtk
      prismlauncher
      blanket
      mixxc

      # CLI
      ouch
      niv
      tree
      tgpt
      tty-clock
      adbtuifm
      neovim
      libnotify
      speedtest-cli
      hydra-check
      glow
      gping
      hut
      unstable.nvtopPackages.intel
      sysz
      systemctl-tui
      bluetuith
      ghfetch
      charm-freeze
      exiftool
      xdg-utils
      nitch
      pulsemixer
      ani-cli
      maven
      manga-cli
      transmission
      du-dust
      fzf
      musikcube
      qmmp
      mediainfo
      unrar
      onefetch
      asciinema
      asciinema-agg
      asciinema-scenario
      xdragon
      nix-output-monitor
      nix-init
      nix-update
      nixfmt-rfc-style
      lexido
      manix
      zaread
    ])
    (with pkgs.gnome; [dconf-editor gnome-clocks file-roller cheese])
    [inputs.trashy.packages.${system}.trashy]
  ];
}
