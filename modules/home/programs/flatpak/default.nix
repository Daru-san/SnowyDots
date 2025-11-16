{ inputs, ... }:
{
  imports = [
    inputs.nix-flatpak.homeManagerModules.default
  ];
  services.flatpak = {
    enable = true;
    uninstallUnmanaged = true;
    packages = [

    ];
    update = {
      onActivation = true;
      auto = {
        enable = true;
        onCalendar = "weekly";
      };
    };
    overrides = {
      global = {
        Context.sockets = [
          "wayland"
          "!x11"
          "!fallback-x11"
        ];

        Environment = {
          XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";

          GTK_THEME = "Adwaita:dark";
        };
      };
    };
  };
}
