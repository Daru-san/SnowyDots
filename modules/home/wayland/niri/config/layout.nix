{ pkgs, lib, ... }:
{
  programs.niri.settings = {
    prefer-no-csd = true;
    hotkey-overlay.skip-at-startup = true;
    cursor.hide-when-typing = false;
    xwayland-satellite = {
      enable = true;
      path = lib.getExe pkgs.xwayland-satellite;
    };
    layout = {
      empty-workspace-above-first = false;
      default-column-display = "tabbed";
      border = {
        enable = false;
      };
      focus-ring = {
        enable = false;
        width = 3;
      };
      gaps = 3;
      tab-indicator = {
        enable = true;
        hide-when-single-tab = true;
      };
    };
    animations = {
      enable = true;
      slowdown = 1.5;

      window-open = {
        kind.easing = {
          duration-ms = 260;
          curve = "cubic-bezier";
          curve-args = [
            0.22
            1.0
            0.36
            1.0
          ];
        };

        custom-shader = ''
          vec4 open_color(vec3 coords_geo, vec3 size_geo) {
              float p = niri_clamped_progress;

              // Slight up-to-down settle.
              float slide_px = (1.0 - p) * 60.0;
              float slide_geo = slide_px / max(size_geo.x, 1.0);

              // Very subtle scale-up into place.
              float scale = 0.985 + 0.015 * p;

              vec2 uv = coords_geo.xy;
              uv -= vec2(0.5, 0.5);
              uv /= scale;
              uv += vec2(0.5, 0.5);

              uv.y -= slide_geo;

              vec3 coords_tex = niri_geo_to_tex * vec3(uv, 1.0);
              vec4 color = texture2D(niri_tex, coords_tex.st);

              // Gentle fade-in.
              color *= p;

              return color;
          }
        '';
      };

      window-close = {
        kind.easing = {
          duration-ms = 180;
          curve = "cubic-bezier";
          curve-args = [
            0.32
            0.0
            0.67
            0.0
          ];
        };

        custom-shader = ''
          vec4 close_color(vec3 coords_geo, vec3 size_geo) {
              float p = niri_clamped_progress;
              float inv = 1.0 - p;

              // Slight downward departure.
              float slide_px = p * 40.0;
              float slide_geo = slide_px / max(size_geo.x, 1.0);

              // Tiny scale-down on exit.
              float scale = 1.0 - 0.012 * p;

              vec2 uv = coords_geo.xy;
              uv -= vec2(0.5, 0.5);
              uv /= scale;
              uv += vec2(0.5, 0.5);

              uv.y -= slide_geo;

              vec3 coords_tex = niri_geo_to_tex * vec3(uv, 1.0);
              vec4 color = texture2D(niri_tex, coords_tex.st);

              color *= inv;
              return color;
          }
        '';
      };

      window-resize = {
        kind.spring = {
          damping-ratio = 1.0;
          stiffness = 720;
          epsilon = 0.0001;
        };

        custom-shader = ''
          vec4 resize_color(vec3 coords_curr_geo, vec3 size_curr_geo) {
              // Show the next texture, but with a very mild softening
              // toward the edges during motion for a less harsh resize feel.
              vec3 coords_tex_next = niri_geo_to_tex_next * coords_curr_geo;
              vec4 color = texture2D(niri_tex_next, coords_tex_next.st);

              vec2 uv = coords_curr_geo.xy;
              float edge =
                  min(min(uv.x, 1.0 - uv.x), min(uv.y, 1.0 - uv.y));

              float vignette = smoothstep(0.0, 0.06, edge);
              color.rgb *= mix(0.985, 1.0, vignette);

              return color;
          }
        '';
      };

      workspace-switch = {
        kind.spring = {
          damping-ratio = 1.0;
          stiffness = 760;
          epsilon = 0.0001;
        };
      };

      horizontal-view-movement = {
        kind.spring = {
          damping-ratio = 1.0;
          stiffness = 640;
          epsilon = 0.0001;
        };
      };

      window-movement = {
        kind.spring = {
          damping-ratio = 1.0;
          stiffness = 700;
          epsilon = 0.0001;
        };
      };

      config-notification-open-close = {
        kind.spring = {
          damping-ratio = 1.0;
          stiffness = 820;
          epsilon = 0.001;
        };
      };

      exit-confirmation-open-close = {
        kind.spring = {
          damping-ratio = 1.0;
          stiffness = 560;
          epsilon = 0.01;
        };
      };

      screenshot-ui-open = {
        kind.easing = {
          duration-ms = 220;
          curve = "cubic-bezier";
          curve-args = [
            0.22
            1.0
            0.36
            1.0
          ];
        };
      };

      overview-open-close = {
        kind.spring = {
          damping-ratio = 1.0;
          stiffness = 620;
          epsilon = 0.0001;
        };
      };

      # recent-windows-close = {
      #   kind.spring = {
      #     damping-ratio = 1.0;
      #     stiffness = 680;
      #     epsilon = 0.001;
      #   };
      # };
    };
  };
}
