{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_small";
        padding.right = 1;
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "break"
        "packages"
        "shell"
        "wm"
        "terminal"
        "break"
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
