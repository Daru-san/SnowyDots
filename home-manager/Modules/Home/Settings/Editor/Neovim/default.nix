{config, pkgs, lib, ...}:{
    programs.neovim = {
      package = pkgs.neovim-nightly;
      enable = true;
      viAlias = true;
      vimAlias = true;
  };
#  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./config;
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  #Add my fork of NvChad to the config
  home.file.".config/nvim" = {
    recursive = true;
    source = pkgs.fetchFromGitHub {
      owner = "0LaMica";
      repo = "Nix-NvChad";
      rev = "a8413849cf9d648df0ae81a9349c8b125e628919";
      sha256 = "u5U7caaHq9lsyYTZ4Gx+TshHIxgqnx03vWVWzKBqBhI=";
    };
  };
  home.file.".config/nvim/custom/chadrc.lua".text = ''
  ---@type ChadrcConfig
  local M = {}

  -- Path to overriding theme and highlights files
  local highlights = require "custom.highlights"

  M.ui = {
    theme = "nightfox",
    theme_toggle = { "nightfox", "one_light" },
    transparency = true,

    statusline = {
      theme = "vscode_colored",
    },

    hl_override = highlights.override,
    hl_add = highlights.add,
  }

  M.plugins = "custom.plugins"

  -- check core.mappings for table structure
  M.mappings = require "custom.mappings"

  return M
  '';
}
