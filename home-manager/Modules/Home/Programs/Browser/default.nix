{pkgs, ...}:{
  imports = [
    ./Firefox/default.nix
    ./Extra/default.nix
  ];
  home.packages = with pkgs; [
    lynx #Terminal browser
    w3m #Also a terminal browser and terminal image viewer
  ];
}
