{pkgs, ...}: {
  services.copyq = {enable = false;};
  home.packages = [pkgs.unstable.wl-clipboard-rs];
}
