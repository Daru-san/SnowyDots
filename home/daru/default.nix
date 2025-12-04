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
  ];

  nixpkgs = {
    overlays = lib.flatten [
      (with inputs; [
        yazi.overlays.default
      ])
      (with outputs.overlays; [
        stable-packages
        unstable-packages
        small-packages
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
