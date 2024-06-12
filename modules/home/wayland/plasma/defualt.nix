{inputs, ...}: {
  imports = [inputs.plasma-manager.homeManagerModules.default];
  programs.plasma.enable = true;
}
