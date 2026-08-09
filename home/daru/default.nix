{
  outputs,
  lib,
  osConfig,
  inputs,
  pkgs,
  system,
  ...
}:
{
  imports = [
    ./home.nix
    ./theme
    ./packages.nix
  ];

  nix.package = osConfig.nix.package;
  nixpkgs = {
    overlays = lib.flatten [
      (with outputs.overlays; [
        stable-packages
        unstable-packages
        spice-packages
      ])
      inputs.frostpak.overlays.default
      inputs.kotlin-lsp.overlays.default
      inputs.fjord-launcher.overlays.default
      (self: super: {
        spicetify-cli = pkgs.spice.spicetify-cli;
      })
      (_: _: {
        paulxstretch = inputs.audio.packages.${system}.paulxstretch;
      })
      (self: super: {
        nautilus = super.nautilus.overrideAttrs (nsuper: {
          buildInputs =
            nsuper.buildInputs
            ++ (with super.gst_all_1; [
              gst-plugins-good
              gst-plugins-bad
            ]);
        });
      })
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
}
