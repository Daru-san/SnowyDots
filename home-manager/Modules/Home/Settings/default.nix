{config, pkgs, ...}:{
  imports = [
  #Import home settings
    ./Shell/default.nix
    ./pkgs/default.nix
    ./Audio/default.nix
    ./Development/default.nix
    ./Editor/default.nix
    ./Directories/default.nix
  ];
}
