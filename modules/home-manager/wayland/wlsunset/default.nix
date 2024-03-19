#TODO: expand configuration if/when https://github.com/nix-community/home-manager/pull/5035 gets merged
{
  # imports = [./wlsunset.nix];
  services.wlsunset = {
    enable = true;
    # time = {
    #   sunrise = "05:50";
    #   sunset = "18:50";
    # };
    gamma = "0.9";
    latitude = "25.99";
    longitude = "28.13";
  };
}
