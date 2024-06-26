{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];
  home.packages = with pkgs; [bun];
  programs.ags = {
    extraPackages = with pkgs; [sassc bun];
    configDir = ./config;
  };
}
