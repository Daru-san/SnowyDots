{pkgs, ...}: {
  services.copyq = {enable = false;};
  home.packages = with pkgs; [wl-clipboard-rs];
}
