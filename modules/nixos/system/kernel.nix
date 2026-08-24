{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.scx = {
    enable = true;
    scheduler = "scx_bpfland";
  };
}
