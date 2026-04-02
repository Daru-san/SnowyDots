# Home packages shared between users
{
  pkgs,
  lib,
  inputs,
  system,
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
      heaptrack
      zapzap
      oculante

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
      nix-tree
      nixfmt

      # CLI
      bluetuith
      spotdl
      ouch
      tree
      libnotify
      fd
      xdg-utils
      unrar
      onefetch
      gtrash
      dconf-editor
      trash-cli
      hexyl
      xdg-user-dirs
      lz4
      android-tools
      mprocs
      authenticator

      prismlauncher
    ])
    (with inputs; [
      fjord-launcher.packages.${system}.default
    ])
  ];
}
