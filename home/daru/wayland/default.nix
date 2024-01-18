{...}:{
  imports = [
    ./waybar/waybar.nix
    ./wallpaper/default.nix
  ];
  wayland = {
    enable = true;
    sway = {
      enable = false;
      swayfx.enable = false;
    };
    hyprland.enable = true;
  };
} 
