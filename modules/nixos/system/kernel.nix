{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos-lto;
    kernelParams = [ "retbleed=stuff" ];
  };
  chaotic.scx.enable = true;
}
