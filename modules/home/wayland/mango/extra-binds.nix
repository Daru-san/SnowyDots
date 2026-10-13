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
  directions-stack = {
    left = "prev";
    right = "next";
  };
  directions = rec {
    left = "left";
    right = "right";
    up = "up";
    down = "down";
    h = left;
    l = right;
    k = up;
    j = down;
  };
in
{
  wayland.windowManager.mango.settings = {
    mousebind = [
      "SUPER, btn_left, moveresize, curmove"
      "SUPER, btn_right, moveresize, curresize"
    ];
    axisbind = [
      "SUPER, up, viewtoleft"
      "SUPER, down, viewtoright"
    ];
    bind = [
      "SUPER, page_up, viewtoleft,"
      "SUPER, page_down, viewtoright"
      "SUPER+SHIFT, page_up, tagtoleft"
      "SUPER+SHIFT, page_down, tagtoright"

      "SUPER, w, toggleoverview"
    ]
    ++
      # Change workspace
      (map (n: "SUPER,${n},view,${n}") workspaces)
    ++ (imap0 (n: key: "SUPER, ${key}, view, ${toString n}") workspaces-numpad)
    # Move window to workspace
    ++ (map (n: "SUPER+SHIFT,${n},tag,${n}, follow") workspaces)
    ++ (imap0 (n: key: "SUPER+SHIFT, ${key}, tag, ${toString n}, follow") workspaces-numpad)
    # Focus next or previous window
    ++ (mapAttrsToList (key: direction: "SUPER, ${key}, focusstack, ${direction}") directions-stack)
    # Move window to next or previous position in stack
    ++ (mapAttrsToList (
      key: direction: "SUPER+CTRL, ${key}, exchange_stack_client, ${direction}"
    ) directions-stack)
    # ++
    # Move windows
    # (mapAttrsToList (key: direction: "SUPER+CTRL,${key},move_client,${direction}") directions)
    # ++
    # Move monitor focus
    # (mapAttrsToList (key: direction: "SUPER+ALT,${key},focusmon,${direction}") directions)
    ++
      # Move workspace to other monitor
      (mapAttrsToList (key: direction: "SUPER+ALT+SHIFT,${key},tagmon,${direction}") directions);
  };
}
