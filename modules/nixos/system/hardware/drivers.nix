# TODO:
# Add nvidia drivers... someday, when I need them that is
{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.os.system.drivers;
in
  with lib; {
    options = {
      os.system.drivers = {
        amdgpu.enable = mkEnableOption "Optimize graphics drivers for amd systems";
        intel.enable = mkEnableOption "Use intel drivers and optimizations";
      };
    };

    config = mkMerge [
      (mkIf cfg.amdgpu.enable {
        hardware.opengl = {
          enable = true;
          driSupport = true;
          driSupport32Bit = true;
          extraPackages = with pkgs; [
            amdvlk
          ];
          extraPackages32 = with pkgs; [
            driversi686Linux.amdvlk
          ];
        };
        services.xserver.videoDrivers = mkIf config.services.xserver.enable ["amdgpu"];
        boot.initrd.kernelModules = ["amdgpu"];
      })
      (mkIf cfg.intel.enable {
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
        # Fix an issue with audio on intel laptops(my laptop specifically)
        boot.kernelParams = ["snd-intel-dspcfg.dsp_driver=1"];

        nixpkgs.config.packageOverrides = pkgs: {
          vaapiIntel = pkgs.vaapiIntel.override {enableHybridCodec = true;};
        };
      })
    ];
  }
