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
        freetube
        scrcpy
        keepassxc
        bridge-core
        g4music
        newsflash
        archiver
        pavucontrol
        iwgtk
        hmcl
        pcmanfm-qt
        blanket

        # CLI
        tree
        tgpt
        tty-clock
        yai
        adbtuifm
        libnotify
        speedtest-cli
        chroma
        glow
        gping
        unstable.nvtopPackages.intel
        sysz
        exiftool
        xdg-utils
        nitch
        pulsemixer
        ani-cli
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
      ])
      (with inputs.snowpkgs.packages.${pkgs.system}; [mixxc])
      (with inputs.scripts.packages.${pkgs.system}; [hm-build nix-rebuild])
      (with pkgs.gnome; [dconf-editor gnome-clocks file-roller gnome-calculator])
      (with inputs.trashy; [defaultPackage.${pkgs.system}])
    ];
}
