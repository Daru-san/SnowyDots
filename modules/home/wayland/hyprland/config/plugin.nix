{ inputs, system, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprland-plugins.packages.${system}.hyprbars
      inputs.hyprscroller.packages.${system}.default
    ];
    settings.plugin = {
      hyprexpo = {
        workspace_method = "center";
      };
    };
  };
}
