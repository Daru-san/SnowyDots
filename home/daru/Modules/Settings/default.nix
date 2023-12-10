{config, pkgs, ...}:{
  imports = [
  #Import home settings
    ./Shell/default.nix
    ./Development/default.nix
    ./Directories/default.nix
  ];
}
