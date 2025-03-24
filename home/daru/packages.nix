# Home packages shared between users
{
  pkgs,
  inputs,
  system,
  lib,
  config,
  ...
}:
{
  home.packages = lib.mkMerge [
    (with pkgs; [
      # GUI
      scrcpy
      keepassxc
      obsidian
      vesktop
      aria2

      # Science
      kdePackages.kalzium
      element
      celestia

      # Content creation
      kdePackages.kdenlive

      # Media
      ffmpeg
      oculante
      exiftool
      mdcat
      g4music
      lua
      qmmp
      mediainfo
      musikcube
      pulsemixer
      stackpkgs.audiorelay

      # Developmentment
      hut
      codeberg-cli
      rustc
      clang
      zig
      jq
      license-go
      yq-go
      gdb
      seer
      valgrind
      xmake
      go

      # Desktop
      swww
      ayugram-desktop

      # GUI Util
      file-roller
      cheese
      stable.varia

      # Android
      adbtuifm
      waydroid-script

      # Documents
      pandoc
      glow
      texliveSmall
      libreoffice-qt6-fresh

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
      nixfmt-rfc-style

      # CLI
      spotdl
      ouch
      tree
      tgpt
      libnotify
      fd
      xdg-utils
      unrar
      onefetch
      gtrash
      rqbit
      dconf-editor
      hexyl
      xdg-user-dirs
      tealdeer
      aichat

      # The craft
      prismlauncher
      neovide
    ])
    (with inputs; [
      # rimi.packages.${system}.default
      color-picker.packages.${system}.default
      (vim.packages.${system}.default.extend {
        nixpkgs.overlays = [ snowpkgs.overlays.default ];
        extraConfigLua = ''
          if vim.g.neovide then
            vim.keymap.set('n', '<D-s>', ':w<CR>')
            vim.keymap.set('v', '<D-c>', '"+y')
            vim.keymap.set('n', '<D-v>', '"+P')
            vim.keymap.set('v', '<D-v>', '"+P')
            vim.keymap.set('c', '<D-v>', '<C-R>+')
            vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli')
            vim.g.neovide_position_animation_length = 0
            vim.g.neovide_cursor_animation_length = 0.00
            vim.g.neovide_cursor_trail_size = 0
            vim.g.neovide_cursor_animate_in_insert_mode = false
            vim.g.neovide_cursor_animate_command_line = false
            vim.g.neovide_scroll_animation_far_lines = 0
            vim.g.neovide_scroll_animation_length = 0.00
            vim.o.guifont = "${config.stylix.fonts.monospace.name}:${toString config.stylix.fonts.sizes.terminal}"
          end
        '';
      })
    ])
  ];
}
