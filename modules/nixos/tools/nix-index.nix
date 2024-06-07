{inputs, ...}: {
  imports = [inputs.nix-index-database.nixosModules.nix-index];
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
