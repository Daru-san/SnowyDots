{
  inputs,
  outputs,
  lib,
  ...
}:
{
  imports = [
    ./home.nix
    ./theme
    ./packages.nix
    ./scripts.nix
  ];

  nixpkgs = {
    overlays = lib.flatten [
      (with inputs; [
        snowpkgs.overlays.default
        stackpkgs.overlays.default
        helix.overlays.default
        yazi.overlays.default
      ])
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
  nix.gc = {
    automatic = true;
    frequency = "daily";
    persistent = true;
  };
}
