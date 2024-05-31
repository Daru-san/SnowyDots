{
  imports = [./plugins.nix];
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    initLua = ./init.lua;
    keymap = import ./keymap.nix;
    settings = {
      manager = {
        ratio = [1 3 4];
        sort_by = "natural";
        sort_dir_first = true;
        show_hidden = false;
        show_symlink = false;
        linemode = "size";
      };
      opener = {
        edit = [
          {
            run = ''nvim "$@"'';
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
      plugin = {
        prepend_previewers = [
          {
            mime = "application/x-bittorrent";
            run = "torrent-preview";
          }
          {
            name = "*/";
            run = "eza-preview";
          }
          {
            mime = "application/*zip";
            run = "ouch";
          }
          {
            mime = "application/x-tar";
            run = "ouch";
          }
          {
            mime = "application/x-bzip2";
            run = "ouch";
          }
          {
            mime = "application/x-7z-compressed";
            run = "ouch";
          }
          {
            mime = "application/x-rar";
            run = "ouch";
          }
          {
            mime = "application/x-xz";
            run = "ouch";
          }
          {
            mime = "audio/*";
            run = "exifaudio";
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
      log = {enabled = false;};
    };
  };
}
