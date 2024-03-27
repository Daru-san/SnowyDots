{
  pkgs,
  inputs,
  ...
}: {
  imports = with inputs.ags.homeManagerModules; [default];
  programs.ags = {
    enable = true;
    extraPackages = with pkgs; [sassc libsoup_3];
  };
}
