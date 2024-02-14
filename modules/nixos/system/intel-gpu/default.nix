{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.os.drivers;
in
  with lib; {
    options = {
      os.drivers = {
        intel.enable = mkEnableOption "Enable drivers for Intel graphics";
      };
    };

    config = mkIf cfg.intel.enable {
      hardware.opengl = {
        enable = true;
        extraPackages = with pkgs; [
          intel-media-driver
          vaapiIntel
          intel-compute-runtime
        ];
        driSupport = true;
        driSupport32Bit = true;
      };
      # Fix an issue with audio on intel laptops
      boot.kernelParams = ["snd-intel-dspcfg.dsp_driver=1"]; #boot.kernelParams = [ "snd_hda_intel.dmic_detect=0" ];

      nixpkgs.config.packageOverrides = pkgs: {
        vaapiIntel = pkgs.vaapiIntel.override {enableHybridCodec = true;};
      };
    };
  }
