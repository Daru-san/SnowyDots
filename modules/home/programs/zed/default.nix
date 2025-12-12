{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    enable = true;
    extraPackages = import ./extra-packages.nix { inherit pkgs; };
    extensions = [
      "zig"
      "kotlin"
      "java"
      "just"
      "jq"
      "markdownlint"
      "marksman"
      "meson"
      "vale"
      "lua"
      "nix"
      "nu"
      "toml"
      "scss"
      "typos"
      "vala"
    ];
    mutableUserSettings = false;
    mutableUserKeymaps = false;
    mutableUserTasks = false;
    userTasks = import ./tasks.nix;
    userKeymaps = import ./keymaps.nix;
    userSettings = (import ./settings.nix { inherit lib; }) // {
      "experimental.theme_overrides" = {
        "background.appearance" = "blurred";
        background = "#09090bBB";
        "panel.background" = "#00000000";
        "editor.background" = "#00000000";
        "tab_bar.background" = "#00000000";
        "terminal.background" = "#00000000";
        "toolbar.background" = "#00000000";
        "tab.inactive_background" = "#00000000";
        "tab.active_background" = "#3f3f4650";
        border = "#00000000";
        "status_bar.background" = "#09090bBB";
        "title_bar.background" = "#09090bBB";
        "border.variant" = "#00000000";
        "scrollbar.track.background" = "#52525b20";
        "scrollbar.track.border" = "#00000000";
        "scrollbar.thumb.background" = "#52525b30";
        "scrollbar.thumb.border" = "#00000000";
        "elevated_surface.background" = "#90";
        "surface.background" = "#90";
        "editor.active_line_number" = "#ffffffcc";
        "editor.gutter.background" = "#00000000";
        "editor.indent_guide" = "#ffffff30";
        "editor.indent_guide_active" = "#ffffff80";
        "editor.line_number" = "#ffffff80";
        "editor.active_line.background" = "#3f3f4640";
      };
    };
  };
}
