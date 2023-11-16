{pkgs, config, lib, ...}:{
  #Intel GPU specific hardware configuration
    hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
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
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  system.replaceRuntimeDependencies = [
({ original = pkgs.mesa; replacement = (pkgs.stable.mesa); })
({ original = pkgs.mesa.drivers; replacement = (pkgs.stable.mesa.drivers);})
];
  #Use intel microcode
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  #Enable firmware
  hardware.enableAllFirmware = true;
}
