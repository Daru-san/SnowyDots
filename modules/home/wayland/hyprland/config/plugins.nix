{ pkgs, config, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = with pkgs; [
      hymission
      hyprlandPlugins.hy3
    ];
    settings.plugin = {
      hy3 = {
        tabs = {
          opacity = 0.9;
          text_font = config.stylix.fonts.monospace.name;
        };
        tab_first_window = true;
        no_gaps_when_only = 0;
        autotile = {
          enable = true;
        };
      };
      overview = {
        centerAligned = false;
        autoScroll = true;
        exitOnClick = false;
        onBottom = true;
        showNewWorkspace = false;
        showEmptyWorkspace = false;
      };
    };
  };
}
