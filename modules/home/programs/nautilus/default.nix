{pkgs, ...}: let
  nautEnv = pkgs.buildEnv {
    name = "nautilus-env";

    paths = with pkgs; [
      gnome.nautilus
      gnome.nautilus-python
      nautilus-open-any-terminal
      git-nautilus-icons
    ];
  };
in {
  home = {
    packages = [nautEnv];
    sessionVariables.NAUTILUS_4_EXTENSION_DIR = "${nautEnv}/lib/nautilus/extensions-4";
  };
  dconf.settings."com/github/stunkymonkey/nautilus-open-any-terminal".terminal = "kitty";
  nixpkgs.overlays = [
    (self: super: {
      gnome = super.gnome.overrideScope' (gself: gsuper: {
        nautilus = gsuper.nautilus.overrideAttrs (nsuper: {
          buildInputs =
            nsuper.buildInputs
            ++ (with super.gst_all_1; [
              gst-plugins-good
              gst-plugins-bad
            ]);
        });
      });
    })
  ];
}
