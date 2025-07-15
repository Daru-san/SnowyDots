{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.scx = {
    enable = true;
    package = pkgs.stable.scx.full;
    scheduler = "scx_bpfland";
  };
}
