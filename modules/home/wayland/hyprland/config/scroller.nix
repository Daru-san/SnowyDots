{
  inputs,
  system,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [inputs.hyprscroller.packages.${system}.default];
    settings = {
      general.layout = "scroller";
      plugin.scroller = {
        column_default_width = "maximized";
        focus_wrap = false;
      };
      bind = [
        "super,equal,scroller:cyclesize,next"
        "super,minus,scroller:cyclesize,prev"
        "super, bracketleft, scroller:setmode, row"
        "super, bracketright, scroller:setmode, col"
        "super, mouse_up,scroller:movefocus, up"
        "super,mouse_down,scroller:movefocus, down"
        "supershift,mouse_up,scroller:movefocus,right"
        "supershift,mouse_down,scroller:movefocus,left"
      ];
    };
    extraConfig = ''
      bind = super alt, R, submap, resize
      submap = resize
      binde = , right, resizeactive, 100 0
      binde = , left, resizeactive, -100 0
      binde = , up, resizeactive, 0 -100
      binde = , down, resizeactive, 0 100
      bind = , escape, submap, reset
      submap = reset

      bind = super, tab, scroller:toggleoverview
      bind = super, tab, submap, overview
      submap = overview
      bind = , right, scroller:movefocus, right
      bind = , left, scroller:movefocus, left
      bind = , up, scroller:movefocus, up
      bind = , down, scroller:movefocus, down
      bind = , escape, scroller:toggleoverview,
      bind = , escape, submap, reset
      bind = , return, scroller:toggleoverview,
      bind = , return, submap, reset
      bind = super, tab, scroller:toggleoverview,
      bind = super, tab, submap, reset
      submap = reset

      bind = super, W, submap, fitsize
      submap = fitsize
      bind = , W, scroller:fitsize, visible
      bind = , W, submap, reset
      bind = , right, scroller:fitsize, toend
      bind = , right, submap, reset
      bind = , left, scroller:fitsize, tobeg
      bind = , left, submap, reset
      bind = , up, scroller:fitsize, active
      bind = , up, submap, reset
      bind = , down, scroller:fitsize, all
      bind = , down, submap, reset
      bind = , escape, submap, reset
      submap = reset
    '';
  };
}
