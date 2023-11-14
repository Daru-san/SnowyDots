{...}:{
  imports = [
#Import configs
    ./Desktop/default.nix
    ./Programs/default.nix
    ./Settings/default.nix
  ];
  
  #NixOS version(can't be unstable)
  home.stateVersion = "23.11";
  
  #Home settings
  home.username = "daru";
  home.homeDirectory = "/home/daru";
  programs.home-manager.enable = true;
}
#####
