{pkgs, ...}:{
  imports = [
    ./kitty.nix
    ./swaylock.nix
    ./waybar.nix
    ./kanshi.nix
    ./copyq.nix
    ./swayidle.nix
    ./wlogout.nix
    ./anyrun.nix
    ./ags.nix
  ];
  home.packages = with pkgs; [
    wl-clipboard
    swaynotificationcenter
  ];
}
