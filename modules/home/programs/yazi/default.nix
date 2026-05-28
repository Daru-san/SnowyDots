{ pkgs, config, ... }:
{
  imports = [ ./plugins.nix ];
  stylix.targets.yazi.enable = true;
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
            url = "*.ts";
            use = "edit";
          }
          {
            url = "*.zig";
            use = "edit";
          }
          {
            url = "*.zig.zon";
            use = "edit";
          }
          {
            url = "meson.build";
            use = "edit";
          }
          {
            url = "*.vala";
            use = "edit";
          }
          {
            url = "*.xml";
            use = "edit";
          }
          {
            url = "*.bp";
            use = "edit";
          }
          {
            url = "Makefile";
            use = "edit";
          }
          {
            url = "*.mk";
            use = "edit";
          }
          {
            url = "Kconfig";
            use = "edit";
          }
          {
            url = "build.config*";
            use = "edit";
          }
        ];
      };
      plugin = {
        append_previewers = [
          {
            url = "*";
            run = ''piper -- hexyl --border=none --terminal-width=$w "$1"'';
          }
        ];
        prepend_fetchers = [
          {
            group = "git";
            url = "*";
            run = "git";
          }
          {
            group = "git";
            url = "*/";
            run = "git";
          }
        ];
        prepend_previewers = [
          {
            url = "*.ts";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            url = "text/*";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            url = "*.zig";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            url = "*.zig.zon";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            url = "meson.build";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            url = "*.vala";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            url = "*.xml";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            url = "*.bp";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            url = "Makefile";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            url = "*.mk";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            url = "Kconfig";
            run = ''piper -- bat -p --color=always "$1"'';
          }
          {
            url = "build.config*";
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
            url = "*.md";
            run = ''piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark "$1"'';
          }
          {
            url = "*.mdx";
            run = ''piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark "$1"'';
          }
          {
            url = "*.rst";
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
