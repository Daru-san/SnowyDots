{
  inputs,
  pkgs,
  system,
  ...
}:
{
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    extraPackages =
      (with pkgs; [
        dart-sass
      ])
      ++ (with inputs.ags.packages.${system}; [
        hyprland
        network
        tray
        wireplumber
        mpris
        bluetooth
      ]);
    configDir = ./config;
    systemd.enable = true;
  };
}
