{pkgs, ...}:{
  imports = [
    ./kitty.nix
    ./swaylock.nix
    ./waybar.nix
    ./kanshi.nix
    ./copyq.nix
    ./swayidle.nix
    ./fuzzel.nix
    ./wlogout.nix
    ./anyrun.nix
  ];
  home.packages = with pkgs; [
    wl-clipboard
    swaynotificationcenter
  ];
}
