#Home programs
{config, pkgs, lib, outputs, ...}:{
  imports = with outputs.homeManagerModules; [
    # KDE connect and syncthing
    kdeconnect
    syncthing
  ]++[
    ./cli/default.nix
    ./Music/default.nix
    ./Video/default.nix
    ./Games/default.nix
    ./Browser/default.nix
    ./desktop-entries.nix
  ];


  home.packages = with pkgs; 
    [
    anytype
    krita
    newsflash
    evince
    gnome.nautilus
    gnome.dconf-editor
    freetube
    komikku
    scrcpy
    # localsend
    gnome.gnome-software
    keepassxc
    pqiv
    losslesscut-bin
    fragments
    anime4k
    gnome-clocks
  ];
}
