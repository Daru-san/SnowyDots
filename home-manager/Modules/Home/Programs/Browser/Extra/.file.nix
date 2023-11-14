{config, pkgs, ...}:{
  home.packages = with pkgs; [
    imgbrd-grabber
  ];
}
