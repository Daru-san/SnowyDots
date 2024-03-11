{
  inputs,
  pkgs,
  ...
}: {
  imports = [./pyprland.nix];
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hycov.packages.${pkgs.system}.hycov
    ];
    extraConfig = ''
      plugin {
        hycov {
          overview_gappo = 60 #gaps width from screen
          overview_gappi = 24 #gaps width from clients
          hotarea_size = 10 #hotarea size in bottom left,10x10
          enable_hotarea = 1 # enable mouse cursor hotarea
        }
      }
    '';
  };
}
