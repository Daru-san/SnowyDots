{inputs, ...}: {
  imports = [inputs.nix-index-database.hmModules.nix-index];
  programs = {
    command-not-found.enable = false;
    nix-index-database = {
      comma.enable = true;
    };
    nix-index = {
      enable = true;
      symlinkToCacheHome = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
