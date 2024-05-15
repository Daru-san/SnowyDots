{
  imports = [./lua.nix ./plugins.nix];
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
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
            mime = "audio/*";
            run = "exifaudio";
          }
          {
            mime = "*.md";
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
