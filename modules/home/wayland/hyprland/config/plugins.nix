{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = with pkgs.hyprlandPlugins; [
      hy3
      hyprspace
    ];
    settings.plugin = {
      hy3 = {
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
