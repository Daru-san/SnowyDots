{
  pkgs,
  lib,
  ...
}: {
  imports = [./hardware-configuration.nix];
  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = true;
    users.root.hashedPassword = "!";
    users.daru = {
      shell = pkgs.fish;
      isNormalUser = true;
      useDefaultShell = true;
      description = "Daru";
      extraGroups = ["networkmanager" "wheel" "video" "adbusers" "input"];
    };
  };
  programs = {
    nix-ld.enable = true;
    gnome-disks = {enable = true;};
    kdeconnect = {
      enable = true;
      package = lib.mkDefault pkgs.kdePackages.kdeconnect-kde;
    };
    yazi.enable = false;
  };

  services = {
    syncthing = {
      enable = true;
      dataDir = "/home/daru";
      user = "daru";
      configDir = "/home/daru/.sync";
      settings = {gui = {theme = "black";};};
    };
  };

  environment.systemPackages = with pkgs; [
    htop
    nix-prefetch-git
    nix-prefetch-github
    unzip
    zip
    unrar
    p7zip
    commonsCompress
    clinfo
    glxinfo
    exfatprogs
    nurl
    jmtpfs
    nix-melt
    ncdu
    busybox
    usbutils
    gparted
    home-manager
    alejandra
    nix-inspect
    nixpkgs-review
    cachix
    file
    v4l-utils
    bandwhich
  ];
  system.laptop = true;
  boot.kernelParams = ["video=eDP-1:d"];
  time.timeZone = "Africa/Johannesburg";
  i18n.defaultLocale = "en_ZA.UTF-8";
}
