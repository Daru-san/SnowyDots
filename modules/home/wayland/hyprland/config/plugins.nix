{ pkgs, config, ... }:
{
  wayland.windowManager.hyprland = {
    plugins =
      (with pkgs.hyprlandPlugins; [
        (hy3.overrideAttrs (
          old:
          (finalAttrs: {
            version = "0.55.0";
            src = pkgs.fetchFromGitHub {
              owner = "outfoxxed";
              repo = "hy3";
              tag = "hl${finalAttrs.version}";
              hash = "sha256-P3wwiIfqo89evW7xzI+wOI/qM1WPZBiiSmGNtBmYeVk=";
            };
          })
        ))
      ])
      ++ (with pkgs; [ hymission ]);
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
