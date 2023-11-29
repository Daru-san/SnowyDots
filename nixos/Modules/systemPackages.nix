{pkgs, ...}:{

  #Enable flatpack
  services.flatpak.enable = true;

  programs = {

    #Enable gnome-disks
    gnome-disks.enable = true;
  };

  #System packages
  environment.systemPackages = with pkgs; [
    ranger
    htop
    wget
    nix-prefetch-git
    nix-prefetch-github
    gcc
    glib
    nodejs_20
    unzip
    clang
    zig
    iw
    clinfo
    glxinfo
    exfatprogs
    nurl
    nix-melt
    gparted
    ncdu
    busybox
    usbutils
    nix-rebuild
    playerctl
  ];
}
