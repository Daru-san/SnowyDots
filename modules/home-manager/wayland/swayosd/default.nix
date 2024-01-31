{...}:{
  imports = [./swayosd.nix];
  services.swayosd = {
    enable = true;
    maxVolume = 100;
  };
}
