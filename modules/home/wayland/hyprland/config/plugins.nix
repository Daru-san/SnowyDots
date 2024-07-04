{
  inputs,
  system,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprscroller.packages.${system}.default
    ];
    settings.plugin.scroller = {
      column_default_width = "maximized";
    };
  };
}
