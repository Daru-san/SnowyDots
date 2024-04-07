{
  services.polybar = {
    enable = true;
    extraConfig = builtins.readFile ./bar.toml;
    script = "polybar bar &";
  };
}
