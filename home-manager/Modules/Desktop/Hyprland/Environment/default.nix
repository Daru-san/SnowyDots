{pkgs, ...}:{
  imports = [
    ./kitty.nix
    ./swayosd.nix
    ./swaylock.nix
    ./waybar.nix
    ./playerctl.nix
    ./kanshi.nix
    ./copyq.nix
    ./swayidle.nix
    ./fuzzel.nix
    ./wlogout.nix
  ];
  home.packages = with pkgs; [
    wl-clipboard
    swaynotificationcenter
    wtype 
  ];
}
