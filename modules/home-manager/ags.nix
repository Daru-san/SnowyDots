{ imports, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    # Enable ags
    enable = true;

    # packages to add to gjs's runtime
    extraPackages = [ pkgs.libsoup_3 ];
  };
}
