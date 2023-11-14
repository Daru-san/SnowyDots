{config, pkgs, ...}:{
  imports = [
    ./Themes/default.nix
    ./Environment/default.nix
    ./Settings/default.nix
  ];

  #Enable Hyprland
  programs.hyprland = {
    enable = true;

    #Set hyprland to unstable
    package = pkgs.unstable.hyprland;
  };
}
