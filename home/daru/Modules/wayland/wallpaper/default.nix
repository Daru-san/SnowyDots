#Wallpaper config
{config, pkgs, lib, ...}: let
  #Set wallpapers from https://github.com/D3Ext/aesthetic-wallpapers
  aesthetic-wallpapers = pkgs.fetchgit {
    url = "https://github.com/D3Ext/aesthetic-wallpapers";
    rev = "f1a4270055bdb7856e127553db3f420";
    sha256 = "09cc87qywwvx44ajbnjg2v0jzp05ymgnmfm0b45qqdxqlamx5034";
  };
  ps-walls = pkgs.fetchgit {
    url = "https://github.com/Daru-san/wallpapers";
    rev = "2080c988cea252b0e444480e59d6d2039d5c8c4f";
    sha256 = "bXzmwTbgLIpGr3ff7Eh07XU0HxFOOgIuD0ukm9ngRmA=";
  };
  walls = pkgs.fetchgit {
    url = "https://github.com/dharmx/walls";
    rev = "b4c6dceceeea44091e6b794623abd797a9ec50dd";
    sha256 = "EJar3MOneahxst8op/eMxd4jdxcCIDgPO3ptpdaWVj4=";
  };
in {

  home.packages = with pkgs; [
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
  #Source my own personal wallpapers from my wallpapers repo
  home.file."Wallpapers/personal" = {
    source = "${ps-walls}/wallpapers";
    recursive = true;
  };
  home.file."Wallpapers/walls" = {
    source = "${walls}";
    recursive = true;
  };
}
