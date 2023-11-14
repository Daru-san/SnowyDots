{pkgs, config, ...}:{
  imports = [
    ./rofi/rofi.nix
    ./kitty.nix
    ./swayosd.nix
    ./swaylock.nix
    ./waybar.nix
    ./playerctl.nix
    ./kanshi.nix
    ./copyq.nix
    # ./anyrun.nix
    ./swayidle.nix
  ];
  home.packages = with pkgs; [
    wl-clipboard
    swaynotificationcenter
    hyprpicker #I need to get this to work with notifications
    wtype 
  ];
  home.sessionVariables = {
    #Make kitty the default terminal
    TERMINAL = "${config.programs.kitty.package}/bin/kitty";
  };
}
