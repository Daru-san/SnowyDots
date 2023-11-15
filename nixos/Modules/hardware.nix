{pkgs, ...}:{
  #Intel GPU specific hardware configuration
    hardware.opengl = {
    enable = true;
    extraPackages = with pkgs.unstable; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      intel-compute-runtime
      intel-gmmlib
      intel-ocl
    ]; 
    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-media-driver
      vaapiIntel
    ];
    driSupport = true;
    driSupport32Bit = true;
  };
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.unstable.vaapiIntel.override { enableHybridCodec = true; };
  };
}
