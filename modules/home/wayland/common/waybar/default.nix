{
  config,
  lib,
  ...
}:
let
  colors = config.lib.stylix.colors.withHashtag;
  color-names = [
    "base00"
    "base01"
    "base02"
    "base03"
    "base04"
    "base05"
    "base06"
    "base07"
    "base08"
    "base09"
    "base0A"
    "base0B"
    "base0C"
    "base0D"
    "base0E"
    "base0F"
  ];
  define-colors = name: value: "@define-color ${name} ${value};";
in
{
  stylix.targets.waybar.enable = false;
  programs.waybar = {
    enable = true;

    systemd.enable = true;

    settings = import ./setup.nix { inherit config lib; };

    style = lib.concatLines (
      lib.flatten [
        (builtins.map (color: define-colors color colors.${color}) color-names)

        (builtins.readFile ./style.css)

        ''
          /* Font configuration */
          * {
            font-family: ${config.stylix.fonts.monospace.name};
            font-size: 12pt;
          }
        ''
      ]
    );
  };
}
