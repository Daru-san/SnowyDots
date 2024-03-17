{
  system.nixos.tags = ["ext-display"];
  boot.kernelParams = ["video=eDP-1:d" "video=LVDS-1:d"];
}
