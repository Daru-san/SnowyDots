{ config, lib, ... }:
let
  mod = "${config.wayland.windowManager.sway.config.modifier}";
  workspaces = (map toString (lib.range 0 9))
    ++ (map (n: "F${toString n}") (lib.range 1 12));
in {
  wayland.windowManager.sway.extraConfig = let
    monitor = "HDMI-A-1";

    # set workspaces
    workspace = lib.concatLines (map (n:
      "set $ws${n} ${n}"
      # "workspace ${n} output ${monitor}" //Alternative route
    ) workspaces);

    # Switch to workspace
    switchworkspace = lib.concatLines
      (map (n: "bindsym --to-code ${mod}+${n} workspace $ws${n}") workspaces);

    # Move window to workspace
    moveworkspace = lib.concatLines (map (n:
      "bindsym --to-code ${mod}+Shift+${n} move container to workspace $ws${n}")
      workspaces);
  in ''
    ${workspace}
    ${switchworkspace}
    ${moveworkspace}
  '';
}
