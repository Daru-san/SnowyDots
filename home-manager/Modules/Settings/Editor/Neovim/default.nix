{config, pkgs, lib, ...}:{
    programs = {
      neovim = {
        #Enable neovim, set to nightly and make it the default editor
        package = pkgs.neovim-nightly;
        enable = true;
        defaultEditor = true;

        #Vi and vim aliases
        viAlias = true;
        vimAlias = true;  

        plugins = with pkgs.vimPlugins; [
	  vim-prettier
	  FTerm-nvim
	  ChatGPT-nvim
	  bufferline-nvim
	  cheatsheet-nvim
	  dashboard-nvim
	  nvim-lspconfig
	  nvim-colorizer-lua
	  nvim-comment
	  nvim-autopairs
	  indent-blankline-nvim
	  gitsigns-nvim
	  lazy-nvim
	  lazygit-nvim
	  luasnip
	  friendly-snippets
	  galaxyline-nvim

          #Telescope plugins
          telescope-nvim
          telescope-coc-nvim
          telescope-undo-nvim
          telescope-symbols-nvim
          telescope-media-files-nvim
          telescope-fzf-native-nvim
          telescope-fzf-writer-nvim
          telescope-cheat-nvim
          telescope-file-browser-nvim
          
	  #Treesitter
	  nvim-treesitter-textobjects
	  nvim-treesitter-refactor
	  nvim-treesitter-parsers.vim
	  nvim-treesitter-parsers.vimdoc
	  nvim-treesitter-parsers.scss
	  nvim-treesitter-parsers.rasi
	  nvim-treesitter-parsers.python
	  nvim-treesitter-parsers.passwd
	  nvim-treesitter-parsers.nix
	  nvim-treesitter-parsers.markdown
	  nvim-treesitter-parsers.markdown_inline
	  nvim-treesitter-parsers.make
	  nvim-treesitter-parsers.lua
	  nvim-treesitter-parsers.java
	  nvim-treesitter-parsers.html
	  nvim-treesitter-parsers.go
	  nvim-treesitter-parsers.git_config
	  nvim-treesitter-parsers.gitcommit
	  nvim-treesitter-parsers.gitignore
	  nvim-treesitter-parsers.git_rebase
	  nvim-treesitter-parsers.css
	  nvim-treesitter-parsers.json
	  nvim-treesitter-parsers.comment
	  nvim-treesitter-parsers.c
	  nvim-treesitter-parsers.bash
	  nvim-treesitter-parsers.ini
	  cmp-treesitter 
	  nvim-treesitter-parsers.lua
        ];
      };
    };
  }
