{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];
  programs.ags = {
    extraPackages = with pkgs; [sassc libsoup_3];
  };
}
