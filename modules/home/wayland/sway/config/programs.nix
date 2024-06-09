{pkgs, ...}: {
  home.packages = with pkgs; [swayws swayr swaytools];
}
