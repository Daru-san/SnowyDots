{
  system.nixos.tags = ["plasma"];
  programs.dconf.enable = true;
  services = {
    xserver = {
      enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    desktopManager.plasma6.enable = true;
  };
}
