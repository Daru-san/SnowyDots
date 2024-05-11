{
  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "wm"
        "cpu"
        "gpu"
        "memory"
        "swap"
        "display"
        "disk"
        "break"
        "colors"
      ];
    };
  };
}
