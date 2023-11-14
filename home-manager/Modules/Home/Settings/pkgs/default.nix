{config, pkgs, ...}:
let
  nur-no-pkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {};
in
{
  #ADD nur pkgs to home manager

  home.file.".config/nixpkgs/config.nix".text = ''
    {
  packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
}
  '';
#Allow unfree packages(home generation doesn't work without it)
  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = 1;
  };
}
