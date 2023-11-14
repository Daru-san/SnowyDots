{pkgs, ...}:{
  imports = [
    ./rofi/rofi.nix
    ./kitty.nix
    ./swayosd.nix
    ./swaylock.nix
    ./waybar.nix
    ./playerctl.nix
    ./kanshi.nix
    ./copyq.nix
    ./swayidle.nix
  ];
  home.packages = with pkgs; [
    wl-clipboard
    swaynotificationcenter
    hyprpicker #I need to get this to work with notifications
    wtype 
  ];
}
