{lib, ...}: let
  inherit (lib) range mapAttrsToList;
  workspaces = map toString (range 0 9);
  directions = rec {
    left = "l";
    right = "r";
    up = "u";
    down = "d";
    h = left;
    l = right;
    k = up;
    j = down;
  };
in {
  wayland.windowManager.hyprland.extraConfig = ''
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
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "SUPER,mouse:272,movewindow"
      "SUPER,mouse:273,resizewindow"
    ];
    bind =
      [
        "SUPER,minus,splitratio,-0.25"
        "SUPERSHIFT,minus,splitratio,-0.3333333"

        "SUPER,equal,splitratio,0.25"
        "SUPERSHIFT,equal,splitratio,0.3333333"

        "SUPER,apostrophe,changegroupactive,f"
        "SUPERSHIFT,apostrophe,changegroupactive,b"

        "SUPER,u,togglespecialworkspace,stash"

        "supershift,o,cyclenext"
        "super,o,changegroupactive"

        "super,equal,scroller:cyclesize,next"
        "super,minus,scroller:cyclesize,prev"
      ]
      ++
      # Change workspace
      (map (n: "SUPER,${n},workspace,${n}") workspaces)
      ++
      # Move window to workspace
      (map (n: "SUPERSHIFT,${n},movetoworkspace,${n}") workspaces)
      ++
      # Move focus
      (mapAttrsToList
        (key: direction: "SUPER,${key},scroller:movefocus,${direction}")
        directions)
      ++
      # Swap windows
      (mapAttrsToList
        (key: direction: "SUPERSHIFT,${key},scroller:movewindow,${direction}")
        directions)
      ++
      # Move windows
      (mapAttrsToList
        (key: direction: "SUPERCONTROL,${key},movewindoworgroup,${direction}")
        directions)
      ++
      # Move monitor focus
      (mapAttrsToList
        (key: direction: "SUPERALT,${key},focusmonitor,${direction}")
        directions)
      ++
      # Move workspace to other monitor
      (mapAttrsToList (key: direction: "SUPERALTSHIFT,${key},movecurrentworkspacetomonitor,${direction}")
        directions);
  };
}
