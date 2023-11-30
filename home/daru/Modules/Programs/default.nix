#Home programs
{config, pkgs, lib, ...}:{
  imports = [
    ./cli/default.nix
    ./Music/default.nix
    ./Video/default.nix
    ./Games/default.nix
    ./Browser/default.nix
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
    logseq-wayland
    krita
    rssguard
    libsForQt5.okular
    libsForQt5.dolphin
    libsForQt5.plasma-disks
    partition-manager
    freetube-wayland
    komikku
    scrcpy
    localsend
    libsForQt5.discover
    keepassxc
    github-desktop-wayland
    pqiv
    transmission-qt
  ];
}
