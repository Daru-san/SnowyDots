{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.scx-loader = {
    enable = true;
    config = {
      default_sched = "scx_rustland";
    };
  };
}
