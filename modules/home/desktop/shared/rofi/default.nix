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
    ];
    font = "JetbrainsMono Nerd Font 15";
    location = "center";
  };
  xdg.configFile."rofi/theme.rasi".source =
    pkgs.fetchFromGitHub {
      owner = "lr-tech";
      repo = "rofi-themes-collection";
      rev = "f87e08300cb1c984994efcaf7d8ae26f705226fd";
      hash = "sha256-A6zIAQvjfe/XB5GZefs4TWgD+eGICQP2Abz/sQynJPo=";
    }
    + "/themes/spotlight-dark.rasi";

  home.packages = with pkgs; let
    powermenu = writeShellScriptBin "rofi-power" ''
      rofi \
        -show p \
        -modi p:'rofi-power-menu --symbols-font "Symbols Nerd Font Mono"' \
        -font "JetBrains Mono NF 16" \
        -theme ~/.config/rofi/theme.rasi \
        -theme-str 'window {width: 8em;} listview {lines: 6;}'
    '';
  in [rofi-power-menu powermenu];
}
