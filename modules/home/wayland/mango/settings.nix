{
  wayland.windowManager.mango = {
    settings = {
      blur = 1;
      blur_layer = 0;
      blur_optimized = 1;
      view_current_to_back = 1;
      blur_params = {
        num_passes = 2;
        radius = 5;
        noise = 0.02;
        brightness = 0.9;
        contrast = 0.9;
        saturation = 1.2;
      };
      border.radius = 6;
      unfocused_opacity = 0.6;
      animations = 1;
      animation_type_open = "zoom";
      animation_type_close = "slide";
      layer_animation_type_open = "slide";
      layer_animation_type_close = "slide";
      fade_in_begin_opacity = 0.5;
      fade_out_begin_opacity = 0.5;
      tag_animation_direction = 0;
      animation = {
        fade_in = 1;
        fade_out = 1;
        duration = {
          move = 500;
          open = 400;
          tag = 300;
          close = 300;
          focus = 30;
        };
        curve = {
          open = "0.46,1.0,0.29,0.99";
          move = "0.46,1.0,0.29,0.99";
          tag = "0.46,1.0,0.29,0.99";
          close = "0.46,1.0,0.29,0.99";
          focus = "0.46,1.0,0.29,0.99";
          opacity = {
            fade_in = "0.46,1.0,0.29,0.99";
            fade_out = "0.5,0.5,0.5,0.5";
          };
        };
      };
      monocle_tab_mode = 1;
      deck_tab_mode = 1;
      border_px = 0;
      gap = {
        inner = {
          horizontal = 1;
          vertical = 1;
        };
        outer = {
          horizontal = 3;
          vertical = 3;
        };
      };
      tab_bar.height = 25;
    };
  };
}
