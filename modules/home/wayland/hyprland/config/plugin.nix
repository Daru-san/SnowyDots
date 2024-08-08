{
  inputs,
  system,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [inputs.hyprland-plugins.packages.${system}.hyprexpo];
  };
}
