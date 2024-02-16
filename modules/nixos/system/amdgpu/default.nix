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
        amdgpu.enable = mkEnableOption "Optimize graphics drivers for amd systems";
      };
    };

    config = mkIf cfg.amdgpu.enable (mkIf (cfg.intel.enable != true) {
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
      services.xserver.videoDrivers = mkIf services.xserver.enable ["amdgpu"];
      boot.initrd.kernelModules = ["amdgpu"];
    });
  }
