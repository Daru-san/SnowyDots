# Home packages
{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [./desktop-entries.nix ./firefox.nix ./spotify.nix ./nautilus.nix];

  home.packages = with lib;
    mkMerge [
      (with pkgs; [
        # GUI
        obsidian
        krita
        newsflash
        freetube
        scrcpy
        keepassxc
        bridge-core
        archiver
        audacity
        overskride
        pavucontrol
        valent
        iwgtk

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
        fontpreview
        xdragon
        rnix-lsp
        trashy
        musikcube
      ])
      # GNOME related packages
      (with pkgs.gnome; [nautilus dconf-editor gnome-clocks file-roller gnome-calculator])
      # These are pinned to 23.11(stable branch) since they're broken on unstable
      (with pkgs.stable; [komikku calcure])
    ];
}
