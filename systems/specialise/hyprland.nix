{
  system.nixos.tags = ["hyprland"];
  wayland = {
    enable = true;
    hyprland.enable = true;
    greetd = {
      enable = true;
      user = "daru";
      command = "Hyprland";
    };
    gnome-extra.enable = true;
  };
}
