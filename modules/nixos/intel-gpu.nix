{pkgs, config, lib, ...}:{
  # Intel GPU specific hardware configuration
    hardware.opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver 
        vaapiIntel         
        intel-compute-runtime
      ]; 
    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-media-driver
      vaapiIntel
    ];
    driSupport = true;
    driSupport32Bit = true;
  };
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  #Enable firmware
  hardware.enableAllFirmware = true;
}
