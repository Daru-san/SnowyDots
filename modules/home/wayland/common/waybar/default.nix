{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = ./setup.nix;
    style = builtins.readFile ./style.css;
  };
}
