{ lib, pkgs, ... }:
{
  boot = {
    kernelParams = [
      "intel_iommu=on"
      "i915.enable_guc=0"
    ];
    kernelModules = [
      "kvmgt"
      "mdev"
      "vfio-iommu-type1"
      "kvm-intel"
    ];
    extraModprobeConfig = lib.concatLines [ "i915 enable_gvt=1" ];
  };
  services.samba = {
    enable = true;
    smbd.enable = true;
    openFirewall = true;
  };
  virtualisation.waydroid.enable = false;
  environment.systemPackages = [ pkgs.quickemu ];
  services.spice-vdagentd.enable = true;
  virtualisation.kvmgt = {
    enable = true;
    vgpus = {
      i915-GVTg_V5_4 = {
        uuid = [ "371badd6-8017-11ef-b809-57641e8f4eb1" ];
      };
    };
  };
}
