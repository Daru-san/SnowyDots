{ pkgs, config, ... }:
{
  imports = [ ./plugins.nix ];
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableNushellIntegration = true;
    enableFishIntegration = true;
    initLua = ./init.lua;
    keymap = import ./keymap.nix;
    theme.flavor = {
      dark = "ayu-dark";
    };
    settings = {
      manager = {
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
        ];
      };
      plugin = {
        append_previewers = [
          {
            name = "*";
            run = "hexyl";
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
            run = "bat";
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
            run = "glow";
          }
          {
            name = "text/*";
            run = "bat";
          }
        ];
      };
      log = {
        enabled = false;
      };
    };
  };
}
