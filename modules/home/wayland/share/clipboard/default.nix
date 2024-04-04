{pkgs, ...}: {
  services.copyq = {enable = false;};
  home.packages = [pkgs.wl-clipboard-rs];
}
