#Home programs
{config, pkgs, lib, ...}:{
  imports = [
    ./cli/default.nix
    ./Music/default.nix
    ./Video/default.nix
    ./Games/default.nix
    ./Browser/default.nix
    ./Images/default.nix
  ];
  home.packages = with pkgs; [
    libreoffice-fresh
    logseq
    pinta
    newsflash
    evince
    gnome3.nautilus
    nautilus-open-any-terminal
    gnome.nautilus-python
    freetube
    komikku
    gthumb
    scrcpy
    localsend
    gnome.file-roller
    gparted
    gnome.gnome-software
    pavucontrol
    keepassxc
  ];
}
