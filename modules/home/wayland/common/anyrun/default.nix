{
  pkgs,
  inputs,
  system,
  ...
}:
let
  plugins = inputs.anyrun.packages.${system};
  inherit (inputs.anyrun-powermenu.packages.${system}) anyrun-powermenu;
in
{
  imports = [ inputs.anyrun.homeManagerModules.default ];
  programs.anyrun = {
    package = pkgs.anyrun;
    config = {
      plugins = with plugins; [
        anyrun-powermenu
        rink
        shell
        applications
        dictionary
      ];

      width.fraction = 0.64;
      y.absolute = 310;
      hidePluginInfo = true;
      closeOnClick = true;
    };
    extraCss = builtins.readFile ./style.css;

    extraConfigFiles = {
      "shell.ron".text = ''
        Config(
          prefix: ":sh",
          shell: None,
        )
      '';
      "powermenu.ron".text = ''
        Config(
          prefix: ":p ",
          engines: [
            Custom(
              name: "Lock",
              cmd: "hyprlock",
              icon: "system-lock-screen",
            ),
            Logout,
            Suspend,
            Hibernate,
            Reboot,
            Shutdown,
          ],
          max_entries: 6,
        )
      '';
      "applications.ron".text = ''
        Config(
          desktop_actions: false,
          max_entries: 5,
        )
      '';
    };
  };
}
