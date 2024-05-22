{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];
  programs.ags = {
    # configDir = ./.;
    extraPackages = with pkgs; [];
  };
}
