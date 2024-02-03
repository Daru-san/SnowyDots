{pkgs, ...}:{

  # Set colorscheme
  stylix = {
    polarity = "dark";
  };


  # Window opacity
  stylix.opacity = {
    applications = 0.9;
    desktop = 0.4;
    popups = 0.8;
    terminal = 0.4;
  };

  # Cursor
  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
  };

  # Enable custom configurations
  stylix.targets = {
    vim.enable = false;
    waybar.enable = true;
    kitty.enable = true;
    kitty.variant256Colors = true;
  };
}
