{
  inputs,
  system,
  ...
}: {
  imports = [inputs.plasma-manager.homeManagerModules.default];
  programs.plasma.enable = true;
  home.packages = [inputs.plasma-manager.packages.${system}.rc2nix];
}
