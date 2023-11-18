{config, pkgs, ...}:{
  wayland.windowManager.hyprland.settings = {
    exec = let
      wall-program = "swww";
      wallpaper = "~/Wallpapers/plant.png";
    in [
      # "zsh -c 'wall-script -w ${wall-program} -i ${wallpaper}'" #Wallpaper script, calling variables from wallpaper.nix file
      "${pkgs.swaynotificationcenter}/bin/swaync"
      "${config.programs.wpaperd.package}/bin/wpaperd"
    ];
    exec-once = [
    "${config.programs.waybar.package}/bin/waybar"
    "${config.programs.kitty.package}/bin/kitty -T Terminal"
    "${config.programs.kitty.package}/bin/kitty -T Git --session git.conf"
    "${config.programs.kitty.pakcage}/bin/kitty -T Clock --hold tty-clock -bscBrn"
    "${pkgs.easyeffects}/bin/easyeffects"
    "${pkgs.networkmanagerapplet}/bin/nm-applet"
    "${config.services.copyq.package}/bin/copyq"
    ];
  };
}
