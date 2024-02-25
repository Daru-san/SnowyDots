# Home packages
{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [./desktop-entries.nix ./music/default.nix ./firefox/default.nix];

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
        pqiv
        fragments
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
      ])
      # GNOME related packages
      (with pkgs.gnome; [nautilus dconf-editor gnome-clocks])
      # These are pinned to 23.11(stable branch) since they're broken on unstable
      (with pkgs.stable; [komikku calcure])
    ];
}
