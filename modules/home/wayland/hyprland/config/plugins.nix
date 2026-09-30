{ pkgs, config, ... }:
let
  colors = config.wayland.windowManager.hyprland.config.group;
in
{
  wayland.windowManager.hyprland = {
    plugins = with pkgs; [
      hyprglass
      hyprlandPlugins.hy3
    ];
    settings.config.plugin = {
      hy3 = {
        tabs = {
          opacity = 0.9;
          text_font = config.stylix.fonts.monospace.name;
          height = 18;
          colors =
            let
              colors = config.stylix.generated.palette;
              rgba = color: alpha: "rgba(${color}${alpha})";
            in
            {
              active = rgba colors.base0D "40";
              active_border = rgba colors.base0D "ee";
              active_text = rgba colors.base05 "ff";

              active_alt_monitor = rgba colors.base02 "40";
              active_alt_monitor_border = rgba colors.base03 "ee";
              active_alt_monitor_text = rgba colors.base05 "ff";

              focused = rgba colors.base02 "40";
              focused_border = rgba colors.base03 "ee";
              focused_text = rgba colors.base05 "ff";

              inactive = rgba colors.base01 "20";
              inactive_border = rgba colors.base02 "aa";
              inactive_text = rgba colors.base05 "ff";

              urgent = rgba colors.base08 "40";
              urgent_border = rgba colors.base08 "ee";
              urgent_text = rgba colors.base05 "ff";

              locked = rgba colors.base0A "40";
              locked_border = rgba colors.base0A "ee";
              locked_text = rgba colors.base05 "ff";
            };
        };
        tab_first_window = true;
        no_gaps_when_only = 0;
        autotile = {
          enable = true;
        };
      };
      hyprglass = {
        enabled = true;
        default_theme = "dark";
        default_preset = "clear";
      };
    };
  };
}
