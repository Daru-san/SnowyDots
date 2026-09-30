{ lib, ... }:
let
  inherit (lib) range mapAttrsToList imap0;
  workspaces = map toString (range 0 9);
  workspaces-numpad = [
    "KP_Insert"
    "KP_End"
    "KP_Down"
    "KP_Next"
    "KP_Left"
    "KP_Begin"
    "KP_Right"
    "KP_Home"
    "KP_Up"
    "KP_Prior"
  ];
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
in
{
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "SUPER,mouse:272,movewindow"
      "SUPER,mouse:273,resizewindow"
    ];
    bind = [
      "SUPER,apostrophe,changegroupactive,f"
      "SUPERSHIFT,apostrophe,changegroupactive,b"

      "SUPER,u,togglespecialworkspace,stash"
      "supershift,u,movetoworkspace,special: stash"

      "super,g, hy3:makegroup, tab, toggle"

      "supershift, g, hy3:changegroup, toggletab"

      "superalt,tab,cyclenext"

      "super, tab, hy3:focustab, r"
      "supershift, tab, hy3:focustab, l"

      "super, page_up, workspace,e-1"
      "super, page_down, workspace,e+1"
      "supershift, page_up, movetoworkspace, r-1"
      "supershift, page_down, movetoworkspace, r+1"
    ]
    ++ lib.flatten [
    ];
  };
}
