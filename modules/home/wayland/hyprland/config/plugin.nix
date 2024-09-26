{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = with pkgs.hyprlandPlugins; [
      hyprbars
      hyprscroller
    ];
    settings.plugin = {
      hyprexpo = {
        workspace_method = "center";
      };
    };
  };
}
