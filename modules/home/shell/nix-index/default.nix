{
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
