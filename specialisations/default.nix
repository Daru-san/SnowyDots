{...}: {
  specialisation = {
    # plasma.configuration = {
    #   imports = [./plasma.nix];
    # };
    plasma-ext-display.configuration = {
      imports = [./plasma.nix ./no-laptop-display.nix];
    };
    hyprland-ext-display.configuration = {
      imports = [./no-laptop-display.nix ./hyprland.nix];
    };
    # hyprland.configuration = {
    #   imports = [./hyprland.nix];
    # };
  };
}
