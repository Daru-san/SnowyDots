{...}: {
  specialisation = {
    plasma.configuration = {
      imports = [./plasma.nix];
    };
    external-display.configuration = {
      imports = [./no-laptop-display.nix];
    };
    hyprland-ext-display.configuration = {
      imports = [./no-laptop-display.nix ./hyprland.nix];
    };
    hyprland.configuration = {
      imports = [./hyprland.nix];
    };
  };
}
