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
    extraModprobeConfig = lib.concatLines [ "options i915 enable_gvt=1" ];
  };
  environment.systemPackages = with pkgs; [
    virt-viewer
    waydroid-helper
  ];

  programs.virt-manager.enable = false;

  virtualisation = {
    waydroid.enable = false;
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    libvirtd = {
      enable = false;
      qemu = {
        package = pkgs.qemu;
        vhostUserPackages = [ pkgs.virtiofsd ];
        verbatimConfig = ''
          capability_filters = [ "device.json" ]
          seccomp_sandbox = 0
        '';
      };
    };
    spiceUSBRedirection.enable = true;
    kvmgt = {
      enable = false;
      vgpus = {
        i915-GVTg_V5_4 = {
          uuid = [ "371badd6-8017-11ef-b809-57641e8f4eb1" ];
        };
      };
    };
  };
}
