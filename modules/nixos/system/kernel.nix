{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_cachyos-lto;
  chaotic.scx = {
    enable = true;
    scheduler = "scx_simple";
  };
}
