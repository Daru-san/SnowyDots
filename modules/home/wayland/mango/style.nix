{
  wayland.windowManager.mango = {
    settings = {
      blur = 1;
      blur_layer = 0;
      blur_optimized = 1;
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
      animation_fade_in = 1;
      animation_fade_out = 1;
      fadein_begin_opacity = 0.5;
      fadeout_begin_opacity = 0.5;
      animation_duration_move = 500;
      animation_duration_open = 400;
      animation_duration_tag = 300;
      animation_duration_close = 300;
      animation_duration_focus = 30;
      animation_curve_open = "0.46,1.0,0.29,0.99";
      animation_curve_move = "0.46,1.0,0.29,0.99";
      animation_curve_tag = "0.46,1.0,0.29,0.99";
      animation_curve_close = "0.46,1.0,0.29,0.99";
      animation_curve_focus = "0.46,1.0,0.29,0.99";
      animation_curve_opafadein = "0.46,1.0,0.29,0.99";
      animation_curve_opafadeout = "0.5,0.5,0.5,0.5";
      group_capture_spawn = 1;
      borderpx = 1;
      gappih = 1;
      gappiv = 1;
      gappoh = 3;
      gappov = 3;
      group_bar = {
        height = 3;
      };
    };
  };
}
