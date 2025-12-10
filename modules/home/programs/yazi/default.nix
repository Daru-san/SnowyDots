{ pkgs, config, ... }:
{
  imports = [ ./plugins.nix ];
  stylix.targets.yazi.enable = false;
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableNushellIntegration = true;
    enableFishIntegration = true;
    initLua = ./init.lua;
    keymap = import ./keymap.nix;
    settings = {
      mgr = {
        ratio = [
          1
          3
          4
        ];
        sort_by = "natural";
        sort_dir_first = true;
        show_hidden = false;
        show_symlink = false;
        linemode = "size";
      };
      preview = {
        image_delay = 0;
      };
      input = {
        cursor_blink = true;
      };
      opener = {
        edit = [
          {
            run = ''${config.home.sessionVariables.EDITOR} "$@"'';
            block = true;
          }
        ];
        play = [
          {
            run = ''mpv "$@"'';
            orphan = true;
            for = "unix";
          }
        ];
        open = [
          {
            run = ''xdg-open "$@"'';
            desc = "Open";
          }
        ];
      };
      open = {
        prepend_rules = [
          {
            name = "*.ts";
            use = "edit";
          }
          {
            name = "*.zig";
            use = "edit";
          }
          {
            name = "*.zig.zon";
            use = "edit";
          }
          {
            name = "meson.build";
            use = "edit";
          }
          {
            name = "*.vala";
            use = "edit";
          }
          {
            name = "*.xml";
            use = "edit";
          }
          {
            name = "*.bp";
            use = "edit";
          }
          {
            name = "Makefile";
            use = "edit";
          }
          {
            name = "*.mk";
            use = "edit";
          }
          {
            name = "Kconfig";
            use = "edit";
          }
          {
            name = "build.config*";
            use = "edit";
          }
        ];
      };
      plugin = {
        append_previewers = [
          {
            name = "*";
            run = ''piper -- hexyl --border=none --terminal-width=$w "$1"'';
          }
        ];
        prepend_fetchers = [
          {
            id = "git";
            name = "*";
            run = "git";
          }
          {
            id = "git";
            name = "*/";
            run = "git";
          }
        ];
        prepend_previewers = [
          {
            name = "*.ts";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            name = "text/*";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            name = "*.zig";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            name = "*.zig.zon";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            name = "meson.build";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            name = "*.vala";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            name = "*.xml";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            name = "*.bp";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            name = "Makefile";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            name = "*.mk";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            name = "Kconfig";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            name = "build.config*";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            mime = "application/bittorrent";
            run = "torrent-preview";
          }
          {
            mime = "application/*zip";
            run = "ouch";
          }
          {
            mime = "application/tar";
            run = "ouch";
          }
          {
            mime = "application/bzip2";
            run = "ouch";
          }
          {
            mime = "application/7z-compressed";
            run = "ouch";
          }
          {
            mime = "application/rar";
            run = "ouch";
          }
          {
            mime = "application/xz";
            run = "ouch";
          }
          {
            name = "*.md";
            run = ''piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark "$1"'';
          }
          {
            name = "*.mdx";
            run = ''piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark "$1"'';
          }
          {
            name = "*.rst";
            run = ''piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark "$1"'';
          }
        ];
      };
      log = {
        enabled = false;
      };
    };
  };
}
