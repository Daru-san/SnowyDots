{ inputs }:
{
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };
  spice-packages = final: _pref: {
    spice = import inputs.spicepkgs {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };
}
