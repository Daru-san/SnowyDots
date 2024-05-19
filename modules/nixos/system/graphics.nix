{pkgs, ...}: {
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
    ];
    driSupport = true;
    driSupport32Bit = true;
  };
  # Fix audio not working
  boot.kernelParams = ["snd-intel-dspcfg.dsp_driver=1"];

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override {enableHybridCodec = true;};
  };
}
