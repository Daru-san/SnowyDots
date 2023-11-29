{pkgs, ...}:{
  imports = [
    #Comment a specific desktop to disable it, this is just to prevent them from messing with each other

    #./Desktop/kde.nix
    #./Desktop/gnome.nix
    ./Desktop/Hyprland.nix
  ];
}
