{inputs, ...}: {
  imports = [inputs.nix-flatpak.homeManagerModules.nix-flatpak];
  services.flatpak = {
    remotes = [
      {
        name = "kdeapps";
        location = "https://distribute.kde.org/kdeapps.flatpakrepo";
      }
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [
      "com.obsproject.Studio"
      "org.libreoffice.LibreOffice"
      "org.prismlauncher.PrismLauncher"
      "org.kde.KStyle.Adwaita"
      "org.kde.PlatformTheme.QGnomePlatform"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
    overrides = {
      global = {
        Context.sockets = ["wayland" "!x11" "!fallback-x11"];
        Environment = {
          XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
          GTK_THEME = "Adwaita:dark";
        };
      };
    };
  };
}
