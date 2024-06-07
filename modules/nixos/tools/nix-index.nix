{
  programs = {
    nix-index = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
    nix-index-database = {
      comma.enable = true;
    };
  };
}
