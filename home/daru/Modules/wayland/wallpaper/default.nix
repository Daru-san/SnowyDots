#Wallpaper config
{config, pkgs, lib, ...}: let
  #Set wallpapers from https://github.com/D3Ext/aesthetic-wallpapers
  aesthetic-wallpapers = pkgs.fetchgit {
    url = "https://github.com/D3Ext/aesthetic-wallpapers";
    rev = "f1a4270055bdb7856e127553db3f420";
    sha256 = "09cc87qywwvx44ajbnjg2v0jzp05ymgnmfm0b45qqdxqlamx5034";
  };
  HQ-Walls = pkgs.fetchgit {
    url = "https://github.com/Daru-san/HighQ-Wallpapers";
    rev = "0a6dbb8e252819972d01cc4d2f23c7e15d704089";
    sha256 = "csXI5ufzyXfPEzFPohAfElvQhyzKEx9GSumXstg4XIA=";
  };
  walls = pkgs.fetchgit {
    url = "https://github.com/dharmx/walls";
    rev = "b4c6dceceeea44091e6b794623abd797a9ec50dd";
    sha256 = "EJar3MOneahxst8op/eMxd4jdxcCIDgPO3ptpdaWVj4=";
  };
in {

  home.packages = with pkgs; [
  #Wallpaper programs
    swww
    swaybg
    waypaper
    wallutils
  ];

  #Source wallpapers from 'github.com/D3Ext/aesthetic-wallpapers'
  home.file."Wallpapers/aesthetic" = {
    source = "${aesthetic-wallpapers}/images";
    recursive = true;
  };
  #Source my own personal wallpapers from my HighQ-Wallpapers repo
  home.file."Wallpapers/personal" = {
    source = "${HQ-Walls}/wallpapers";
    recursive = true;
  };
  home.file."Wallpapers/walls" = {
    source = "${walls}";
    recursive = true;
  };
}
