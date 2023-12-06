#Configuration and declaring of most of the cli programs
{config, pkgs, ...}:{
    imports = [
      #Programs that have specialized modules and configurations
      ./ranger/ranger.nix
      ./btop/btop.nix 
      ./yt-dlp/yt-dlp.nix
      ./translate-shell/default.nix
    ];
    home.packages = with pkgs; [
      tree # tree
      bc # Calculator
      tty-clock # In-terminal clock 
      libnotify # Notifications
      cbonsai # Trees ;)
      ddgr # Searching in the terminal
      losslesscut-bin # Editing videos
      speedtest-cli # Internet speed test
      chroma # For cat coloring
      glow # Markdown editor
      gping # Ping with graphics
      nvtop-intel # Gpu top
      sysz # Systemd service management
      nap # Code snippets
      jrnl # Journal 
      chafa 
      calcure # 
      krabby # Pokemon
      yafetch # Neofetch
      pulsemixer # Audio mixer
      ani-cli # Anime
      pokeshell # Pokemon-neofetch
      du-dust # Better du
      figlet # Art
      lolcat # Colors
      page # Pager using Neovim
      fzf # Finding it fuzzy
    ];
 }
