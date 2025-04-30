{
  imports = [
    ./common
    ./niri
    ./sway
  ];
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
