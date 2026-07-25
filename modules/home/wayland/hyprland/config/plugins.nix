{ pkgs, config, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = with pkgs; [
      hymission
      hyprglass
      (hyprlandPlugins.hy3.overrideAttrs (
        old: finalAttrs: {
          version = "0.56.0.1";
          src = fetchFromGitHub {
            owner = "outfoxxed";
            repo = "hy3";
            tag = "hl${finalAttrs.version}";
            hash = "sha256-iK0vERuy5aXisDXm/bzcJP0dgaIot5MLPoVG62DjqO4=";
          };
        }
      ))
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
      hyprglass = {
        enabled = true;
        default_theme = "dark";
        default_preset = "clear";
      };
      hymission = {
        niri_mode = true;
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
