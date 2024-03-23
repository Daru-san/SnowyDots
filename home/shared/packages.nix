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
        g4music

        # CLI
        tree
        tgpt
        tty-clock
        libnotify
        speedtest-cli
        chroma
        glow
        gping
        nvtop-intel
        sysz
        exiftool
        xdg-utils
        nitch
        pulsemixer
        ani-cli
        manga-cli
        pokeshell
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
      ])
      (with inputs.scripts.packages.${pkgs.system}; [hm-build nix-rebuild])
      (with inputs.trashy; [defaultPackage.${pkgs.system}])
    ];
}
