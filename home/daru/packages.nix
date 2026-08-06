# Home packages shared between users
{
  pkgs,
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
      d-spy
      sysprof
      heaptrack
      zapzap
      grim
      oculante
      audacious
      brave

      # Media
      ffmpeg
      swayimg
      exiftool
      mdcat
      mediainfo
      mpc
      gdu
      pulsemixer
      asciinema
      asciinema-agg
      kdePackages.kdenlive

      # Desktop
      awww

      adbtuifm

      # audio
      audacity
      lmms-full
      reaper

      # VST plugins
      dragonfly-reverb
      airwindows
      geonkick
      chow-tape-model
      surge-xt
      zynaddsubfx
      lsp-plugins

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
      rink

      file-roller
      nautilus
      fjordlauncherreunlocked
      libreoffice-qt-fresh
    ])
  ];
}
