{config, ...}: {
  services.dunst = {
    iconTheme = {inherit (config.gtk.iconTheme) name package;};
  };
}
