{...}: {
  specialisation = {
    plasma = {
      configuration = {
        imports = [./plasma.nix];
      };
    };
    external-display.configuration = {
      imports = [./no-laptop-display.nix];
    };
  };
}
