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


  home.packages = with pkgs; 
  let
    #Package overides to allow electron apps to run in wayland natively
    logseq-wayland = pkgs.logseq.overrideAttrs (old: rec {
      commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
    }); 
    freetube-wayland = pkgs.freetube.overrideAttrs (old: rec {
      commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
    });
    github-desktop-wayland = pkgs.github-desktop.overrideAttrs (old: rec {
      commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
    });
  in
    [
    libreoffice-fresh
    logseq-wayland
    pinta
    newsflash
    evince
    gnome3.nautilus
    nautilus-open-any-terminal
    gnome.nautilus-python
    freetube-wayland
    komikku
    gthumb
    scrcpy
    localsend
    gnome.file-roller
    gparted
    gnome.gnome-software
    pavucontrol
    keepassxc
    github-desktop-wayland
  ];
}
