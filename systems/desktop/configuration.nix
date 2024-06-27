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
      package = pkgs.valent;
    };
    yazi.enable = false;
  };

  services.syncthing = {
    enable = true;
    dataDir = "/home/daru";
    user = "daru";
    configDir = "/home/daru/.sync";
    settings = {gui = {theme = "black";};};
  };

  environment.systemPackages = with pkgs; [
    htop
    nix-prefetch-git
    nix-prefetch-github
    unzip
    zip
    unrar
    p7zip
    clinfo
    glxinfo
    exfatprogs
    nurl
    uutils-coreutils-noprefix
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
  time.timeZone = "Africa/Johannesburg";
  i18n.defaultLocale = "en_ZA.UTF-8";
}
