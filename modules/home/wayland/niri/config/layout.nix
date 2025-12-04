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
      slowdown = 0.60;
    };
  };
}
