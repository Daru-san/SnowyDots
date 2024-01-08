{...}:{
  wayland.windowManager.sway.extraConfig = let
    monitor = "HDMI-A-1";
  in ''
# Set first monitor workspaces to first monitor
workspace $ws_1 output ${monitor}
workspace $ws_2 output ${monitor}
workspace $ws_3 output ${monitor}
workspace $ws_4 output ${monitor}
workspace $ws_5 output ${monitor}
workspace $ws_6 output ${monitor}
workspace $ws_7 output ${monitor}
workspace $ws_8 output ${monitor}
workspace $ws_9 output ${monitor}
workspace $ws_10 output ${monitor}

# Set second monitor workspaces to second monitor
workspace $ws_11 output ${monitor}
workspace $ws_12 output ${monitor}
workspace $ws_13 output ${monitor}
workspace $ws_14 output ${monitor}
workspace $ws_15 output ${monitor}
workspace $ws_16 output ${monitor}
workspace $ws_17 output ${monitor}
workspace $ws_18 output ${monitor}
workspace $ws_19 output ${monitor}
workspace $ws_20 output ${monitor}

# Switch to workspace
bindsym --to-code $mod+1 workspace $ws_1
bindsym --to-code $mod+2 workspace $ws_2
bindsym --to-code $mod+3 workspace $ws_3
bindsym --to-code $mod+4 workspace $ws_4
bindsym --to-code $mod+5 workspace $ws_5
bindsym --to-code $mod+6 workspace $ws_6
bindsym --to-code $mod+7 workspace $ws_7
bindsym --to-code $mod+8 workspace $ws_8
bindsym --to-code $mod+9 workspace $ws_9
bindsym --to-code $mod+0 workspace $ws_10

# Move focused container to workspace
bindsym --to-code $mod+Shift+1 move container to workspace $ws_1
bindsym --to-code $mod+Shift+2 move container to workspace $ws_2
bindsym --to-code $mod+Shift+3 move container to workspace $ws_3
bindsym --to-code $mod+Shift+4 move container to workspace $ws_4
bindsym --to-code $mod+Shift+5 move container to workspace $ws_5
bindsym --to-code $mod+Shift+6 move container to workspace $ws_6
bindsym --to-code $mod+Shift+7 move container to workspace $ws_7
bindsym --to-code $mod+Shift+8 move container to workspace $ws_8
bindsym --to-code $mod+Shift+9 move container to workspace $ws_9
bindsym --to-code $mod+Shift+0 move container to workspace $ws_10

# Second monitor workspaces with F-keys
bindsym --to-code $mod+F1 workspace $ws_11
bindsym --to-code $mod+F2 workspace $ws_12
bindsym --to-code $mod+F3 workspace $ws_13
bindsym --to-code $mod+F4 workspace $ws_14
bindsym --to-code $mod+F5 workspace $ws_15
bindsym --to-code $mod+F6 workspace $ws_16
bindsym --to-code $mod+F7 workspace $ws_17
bindsym --to-code $mod+F8 workspace $ws_18
bindsym --to-code $mod+F9 workspace $ws_19
bindsym --to-code $mod+F10 workspace $ws_20

bindsym --to-code $mod+Shift+F1 move container to workspace $ws_11
bindsym --to-code $mod+Shift+F2 move container to workspace $ws_12
bindsym --to-code $mod+Shift+F3 move container to workspace $ws_13
bindsym --to-code $mod+Shift+F4 move container to workspace $ws_14
bindsym --to-code $mod+Shift+F5 move container to workspace $ws_15
bindsym --to-code $mod+Shift+F6 move container to workspace $ws_16
bindsym --to-code $mod+Shift+F7 move container to workspace $ws_17
bindsym --to-code $mod+Shift+F8 move container to workspace $ws_18
bindsym --to-code $mod+Shift+F9 move container to workspace $ws_19
bindsym --to-code $mod+Shift+F10 move container to workspace $ws_20
  '';
}
