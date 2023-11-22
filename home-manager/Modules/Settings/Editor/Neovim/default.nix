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

        coc = {
          enable = true;
        };
        plugins = with pkgs.vimPlugins; [
        #Coc plugins
          coc-sh
          coc-git
          coc-css
          coc-json
          coc-toml
          coc-html
          coc-java
          coc-cmake
          coc-pairs
          coc-python
          coc-prettier
          coc-highlight
          coc-markdownlint
          coc-snippets
          coc-lua
          coc-spell-checker
          coc-ltex

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
          
          #Barbecue for VSCode like winbar
          barbecue-nvim
        ];
      };
    };
  };
