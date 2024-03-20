{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hycov.packages.${pkgs.system}.hycov
    ];
    extraConfig = ''
      plugin {
        hycov {
          overview_gappo = 60
          overview_gappi = 24
          hotarea_size = 10
          enable_hotarea = 1
        }
      }
    '';
  };
}
