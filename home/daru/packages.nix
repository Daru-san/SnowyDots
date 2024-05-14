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
      pavucontrol
      libreoffice-qt-fresh
      iwgtk
      alt.hmcl
      blanket
      mixxc

      # CLI
      tree
      tgpt
      tty-clock
      yai
      adbtuifm
      libnotify
      speedtest-cli
      hydra-check
      chroma
      glow
      gping
      hut
      unstable.nvtopPackages.intel
      sysz
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
      nil
      musikcube
      music-player
      mediainfo
      unrar
      onefetch
      asciinema
      asciinema-agg
      asciinema-scenario
      xdragon
      nix-du
      manix
      deadnix
      nix-output-monitor
      zaread
      fastfetch
    ])
    (with pkgs.gnome; [dconf-editor gnome-clocks file-roller cheese])
    [inputs.trashy.packages.${system}.trashy]
  ];
}
