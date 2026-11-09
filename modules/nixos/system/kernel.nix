{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  services.scx-loader = {
    enable = true;
    config = {
      default_sched = "scx_flow"; # flash, bpfland, flow, lavd, pandemonium
      default_mode = "LowLatency";
    };
  };
}
