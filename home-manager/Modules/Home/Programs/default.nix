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
    obsidian
    #gimp
    pinta
    mission-center
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
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "obsidian"
  ];
}
