{
  system.nixos.tags = ["hyprland"];
  wayland = {
    enable = true;
    hyprland.enable = true;
  };
}
