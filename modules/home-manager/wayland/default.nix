{pkgs,...}:{
  imports = [
    ./ags/default.nix
    ./copyq/default.nix
    ./anyrun/default.nix
    ./kitty/default.nix
    ./kanshi/default.nix
    ./swayosd/default.nix
    ./swayidle/default.nix
    ./wlogout/default.nix
    ./compositor/default.nix
    ./swaync/default.nix
    ./gtklock/default.nix
  ];
  home.packages = with pkgs; [ wl-clipboard pavucontrol ];
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
