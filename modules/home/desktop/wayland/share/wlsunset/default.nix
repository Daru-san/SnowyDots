{
  imports = [./wlsunset.nix];
  services.wlsunset = {
    gamma = "0.9";
    latitude = "25.99";
    longitude = "28.13";
  };
  services.wlsunset-test = {
    enable = true;
    latitude = "24.2";
    longitude = "15.7";
  };
}
