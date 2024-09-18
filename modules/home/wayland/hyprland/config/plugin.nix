{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = with pkgs.hyprlandPlugins; [
      hyprbars
      hyprexpo
    ];
    settings.plugin = {
      hyprexpo = {
        workspace_method = "center";
      };
    };
  };
}
