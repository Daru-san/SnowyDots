{pkgs, ...}: {
  home.packages = with pkgs; [pyprland];
  xdg.configFile."hypr/pyprland.toml".source = with pkgs;
    (formats.toml {}).generate "pyprland.toml" {
      pyprland = {plugins = ["toggle_special"];};
    };
}
