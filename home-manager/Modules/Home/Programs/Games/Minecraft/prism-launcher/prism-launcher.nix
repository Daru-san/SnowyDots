{ pkgs, lib, prismlauncher, ... }: {
  home.packages = [ prismlauncher.packages.${pkgs.system}.prismlauncher ];
}
