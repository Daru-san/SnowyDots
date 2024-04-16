{
  specialisation = {
    hyprland.configuration = {
      imports = [./no-laptop-display.nix ./hyprland.nix];
    };
    i3wm.configuration = {
      imports = [./no-laptop-display.nix];
      services.xserver.enable = true;
    };
  };
}
