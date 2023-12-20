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
    logseq
    krita
    rssguard
    libsForQt5.okular
    libsForQt5.dolphin
    freetube
    komikku
    scrcpy
    localsend
    libsForQt5.discover
    keepassxc
    pqiv
    transmission-qt
  ];
}
