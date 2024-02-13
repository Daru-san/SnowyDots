{
  pkgs,
  lib,
  inputs,
  ...
}: {
  home.packages = [inputs.prismlauncher.packages.${pkgs.system}.prismlauncher];
}
