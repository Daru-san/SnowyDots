# Home packages shared between users
{
  pkgs,
  inputs,
  system,
  lib,
  ...
}:
{
  home.packages = lib.mkMerge [
    (with pkgs; [
     # GUI
      aria2
      nextcloud-client
      element
      emblem
      elastic
      d-spy
      sysprof

      # Media
      ffmpeg
      swayimg
      exiftool
      mdcat
      mediainfo
      mpc
      gdu
      pulsemixer

      # Desktop
      swww

      adbtuifm

      # Documents
      glow

      # System monitoring
      gping
      speedtest-cli
      sysz
      nvtopPackages.intel
      systemctl-tui

      # Nix
      nix-init
      npins
      nix-output-monitor
      nix-update
      nixfmt

      # CLI
      spotdl
      ouch
      tree
      libnotify
      fd
      xdg-utils
      unrar
      nautilus
      onefetch
      gtrash
      dconf-editor
      hexyl
      xdg-user-dirs
      lz4
      android-tools
      mprocs
      authenticator

      prismlauncher
      file-roller
    ])
    (with pkgs.kdePackages; [
      kdenlive
    ])
  ];
}
