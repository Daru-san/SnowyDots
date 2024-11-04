{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri
  ];
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings.environment = {
      QT_QPA_PLATFORM = "wayland";
      NIXOS_OZONE_WL = "true";
    };
  };
}
