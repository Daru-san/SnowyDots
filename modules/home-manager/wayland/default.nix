{pkgs, ...}: {
  imports = [
    ./ags/default.nix
    ./copyq/default.nix
    ./anyrun/default.nix
    ./kitty/default.nix
    ./kanshi/default.nix
    ./swayosd/default.nix
    ./swayidle/default.nix
    ./compositor/default.nix
    ./swaync/default.nix
    ./gtklock/default.nix
    ./cliphist/default.nix
    ./tschuss/default.nix
    ./wlsunset/default.nix
  ];
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
