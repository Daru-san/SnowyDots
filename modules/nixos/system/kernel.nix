{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_cachyos-lto;
  services.scx = {
    enable = true;
    scheduler = "scx_bpfland";
  };
}
