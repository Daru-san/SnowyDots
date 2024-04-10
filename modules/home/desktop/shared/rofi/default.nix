{
  pkgs,
  config,
  ...
}: {
  programs.rofi = {
    terminal = "${config.programs.alacritty.package}/bin/alacritty";
    plugins = with pkgs; [
      rofi-calc
      rofi-top
      rofi-emoji
      rofi-power-menu
    ];
    font = "JetbrainsMono Nerd Font 15";
    location = "center";
  };
}
