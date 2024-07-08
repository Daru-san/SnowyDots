{
  inputs,
  system,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprscroller.packages.${system}.default
    ];
  };
}
