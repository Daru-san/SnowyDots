{config, pkgs,lib, ...}:
let
#Declare for style
  style = "./Themes/Styles/type-1/style-6.rasi";
in {
  imports = [
    ./scripts.nix
  ];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland; #Set package to rofi-wayland for Hyprland

    plugins = with pkgs; [
      #Rofi plugins
      rofi-calc
      rofi-top
      rofi-emoji
    ];
    font = "Jetbrains Mono Nerd Font 14";
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = "${style}";
    extraConfig = {
      modes = ["drun" "run" "window" "files" "calc" "top"];
    };
  };
  home.packages = with pkgs; [
  #Plugins that aren't directly included
    rofi-bluetooth
     ];
  home.file.".config/rofi/colors".source = config.lib.file.mkOutOfStoreSymlink ./Themes/colors;
  home.file.".config/rofi/Themes".source = config.lib.file.mkOutOfStoreSymlink ./Themes;
}
