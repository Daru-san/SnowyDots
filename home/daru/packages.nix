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
      bridge-core
      newsflash
      archiver
      oculante
      pavucontrol
      libreoffice-qt-fresh
      iwgtk
      prismlauncher
      blanket
      mixxc

      # CLI
      tree
      tgpt
      tty-clock
      adbtuifm
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
      mediainfo
      unrar
      onefetch
      asciinema
      asciinema-agg
      asciinema-scenario
      xdragon
      nix-output-monitor
      zaread
    ])
    (with pkgs.gnome; [dconf-editor gnome-clocks file-roller cheese])
    [inputs.trashy.packages.${system}.trashy]
  ];
}
