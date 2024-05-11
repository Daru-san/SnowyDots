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
        "shell"
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
