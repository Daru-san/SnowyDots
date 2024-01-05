{pkgs, config, ...}:{
  imports = [
    ./binds.nix
    ./input.nix
  ];
#Configuring Hyprland 
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    systemd = {
      enable = true;
    };
    wrapperFeatures = {
      gtk = true;
    };
    config = {
      terminal = "${config.programs.kitty.package}/bin/kitty";
      menu = "${config.programs.fuzzel.package}/bin/fuzzel";
    };
  };
}

