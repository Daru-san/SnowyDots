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
  small-packages = final: _prev: {
    small = import inputs.nixpkgs-small {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };
}
