{inputs, ...}: {
  imports = [inputs.nix-index-database.hmModules.nix-index];
  nix-index-database = {
    comma.enable = true;
  };
  nix-index = {
    enable = true;
    symlinkToCacheHome = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };
}
