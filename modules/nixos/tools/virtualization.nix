{pkgs, ...}: {
  # Android emulation
  virtualisation.waydroid.enable = true;

  # Desktop emulation
  environment.systemPackages = with pkgs; [
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
  ];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModprobeConfig = "options i915 enable_guc=2";
  users.users.daru.extraGroups = ["libvirtd"];
  programs.virt-manager.enable = true;
  services.spice-vdagentd.enable = true;
  virtualisation = {
    kvmgt.enable = true;
    kvmgt.vgpus = {
      i915-GVTg_V5_4 = {
        uuid = ["6ecf0e14-27aa-11ef-abcb-77e6eb5999bc"];
      };
    };
    spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };
  };
}
