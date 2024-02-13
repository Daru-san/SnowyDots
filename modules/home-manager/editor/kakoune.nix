{pkgs, ...}:
let
  kakone = pkgs.fetchgit {
    url = "https://github.com/raiguard/kak-one.git";
    rev = "bc3a1335ff1913d64416668fc9161733b6b48540";
    sha256 = "p/ImGFz/mNvm5xN8hLvt6OwSTKKW/J1tKT/3rwaTyvw=";
  };
in {
  xdg.configFile."kakoune/colors".source = "${kakone}/colors";
  programs.kakoune = {
    enable = true;
    defaultEditor = true;
    config = {
      alignWithTabs = true;
      autoComplete = "insert";
      indentWidth = 2;
      tabStop = 2;
      colorscheme = "one-darker-16";
      autoinfo = ["command" "normal"];

      numberLines = {
        enable = true;
        relative = true;
      };

      ui = {
        enableMouse = true;
        statusLine = "bottom";
        assistant = "none";
      };

      wrapLines = {
        enable = true;
        indent = true;
        word = true;
      };

      showWhitespace = {
        enable = true;
      };
      hooks = [
	
      ];
      keyMappings = [
			{
    	 	key = "<space>/";
    	  effect = "comment-line<ret>";
    	  mode = "user;";
    	  docstring = "comment out a line(s)";
      }
    ];
    extraConfig = ''
      eval %sh{kak-lsp --kakoune -s $kak_session}  # Not needed if you load it with plug.kak.
      lsp-enable
      
      [language.nix]
      filetypes = ["nix"]
      roots = ["flake.nix", "shell.nix", ".git"]
      command = "rnix-lsp"

      require-module powerline
      set-option global powerline_format 'git bufname filetype mode_info lsp'
      set-option global powerline_shorten_bufname name
      powerline-start
      
      define-command tabs-recommended-keys -docstring "set the recommended kak-tabs bindings" %{
 				map global normal q b
  			map global normal Q B
  			map global normal b ': enter-user-mode tabs<ret>' -docstring 'tabs'
 				map global normal B ': enter-user-mode -lock tabs<ret>' -docstring 'tabs (lock)'
			}

			require-module smarttab

			
			require-module auto-pairs	
			set-option global auto_pairs ( ) { } [ ] '"' '"' "'" "'" ` ` “ ” ‘ ’ « » ‹ ›
			enable-auto-pairs

			source "%val{config}/plugins/powerline.kak/rc/modules/bufname.kak"
			source "%val{config}/plugins/powerline.kak/rc/modules/client.kak"
			source "%val{config}/plugins/powerline.kak/rc/modules/filetype.kak"
			source "%val{config}/plugins/powerline.kak/rc/modules/git.kak"  
			source "%val{config}/plugins/powerline.kak/rc/modules/line_column.kak"
			source "%val{config}/plugins/powerline.kak/rc/modules/mode_info.kak"
			source "%val{config}/plugins/powerline.kak/rc/modules/position.kak"
			source "%val{config}/plugins/powerline.kak/rc/modules/session.kak"  
			source "%val{config}/plugins/powerline.kak/rc/modules/lsp.kak"
    '';

    plugins = with pkgs.kakounePlugins; [
      auto-pairs-kak
      fzf-kak
      kak-rainbower
      kakoune-buffers
      active-window-kaki
      kakoune-extra-filetypes
      kakoune-buffer-switcher
      kakoune-state-save
      powerline-kak
      tabs-kak
      smarttab-kak
      quickscope-kak
    ];
  };
  home.packages = with pkgs; [kak-lsp];
}
