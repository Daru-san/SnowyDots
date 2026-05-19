{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.musnix.nixosModules.musnix
  ];

  musnix = {
    enable = true;
    kernel.packages = pkgs.linuxPackages_latest;
  };
}
