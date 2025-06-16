{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = with pkgs.hyprlandPlugins; [
      hy3
      hyprexpo
    ];
    settings.plugin = {
      hy3 = {
        no_gaps_when_only = 0;
        autotile = {
          enable = true;
        };
      };
      hyprexpo = {
        workspace_method = "center first";
      };
    };
  };
}
