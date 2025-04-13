{
  inputs,
  config,
  pkgs,
  system,
  ...
}:
{
  env = {
    editor = {
      extraPackages = [ pkgs.neovide ];
      package = inputs.vim.packages.${system}.default.extend {
        nixpkgs.overlays = [ inputs.snowpkgs.overlays.default ];
        dependencies = {
          yazi.package = pkgs.yazi;
          lazygit.package = pkgs.lazygit;
          go.package = pkgs.go;
          rust-analyzer.package = pkgs.rust-analyzer;
          direnv.package = pkgs.direnv;
          git.package = pkgs.go;
          ripgrep.package = pkgs.ripgrep;
          gcc.package = pkgs.gcc;
        };
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
            vim.o.guifont = "${config.stylix.fonts.monospace.name}:${toString config.stylix.fonts.sizes.terminal}"
          end
        '';
      };
    };
  };
}
