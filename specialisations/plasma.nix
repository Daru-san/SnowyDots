{
  pkgs,
  lib,
  ...
}: {
  system.nixos.tags = ["kde-plasma"];
  wayland = {
    kde.enable = true;
    sddm.enable = true;
  };
  users.users.zaru = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Zanokurou";
    extraGroups = ["networkmanager" "wheel" "video" "adbusers" "input"];
  };
}
