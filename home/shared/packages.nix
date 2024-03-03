# Home packages shared between users
{
  pkgs,
  inputs,
  lib,
  ...
}: {
  home.packages = with lib;
    mkMerge [
      (with pkgs; [
        # GUI
        obsidian
        krita
        freetube
        scrcpy
        keepassxc
        bridge-core
        archiver
        audacity
        valent

        # CLI
        tree
        bc
        tty-clock
        libnotify
        speedtest-cli
        chroma
        glow
        gping
        nvtop-intel
        sysz
        nap
        nitch
        pulsemixer
        ani-cli
        manga-cli
        pokeshell
        transmission
        du-dust
        fzf
        unrar
        onefetch
        asciinema
        asciinema-agg
        asciinema-scenario
        xdragon
        rnix-lsp
        trashy
      ])
    ];
}
