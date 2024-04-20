{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];
  programs.ags = {
    package = pkgs.ags;
    extraPackages = with pkgs; [sassc libsoup_3];
  };
}
