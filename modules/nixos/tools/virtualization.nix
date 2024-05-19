{pkgs, ...}: {
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
  users.users.daru.extraGroups = ["libvirtd"];
  programs.virt-manager.enable = true;
  services.spice-vdagentd.enable = true;
  virtualisation = {
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
