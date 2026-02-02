{
  outputs,
  lib,
  osConfig,
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
      ])
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
