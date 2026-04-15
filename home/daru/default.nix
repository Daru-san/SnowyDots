{
  outputs,
  lib,
  osConfig,
  inputs,
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
      (self: super: {
        zls_0_16 = inputs.zls.packages.${system}.default;
        zig_0_16 = inputs.zig.packages.${system}.zig_0_16_0;
      })
      (with outputs.overlays; [
        stable-packages
        unstable-packages
      ])
      inputs.frostpak.overlays.default
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
