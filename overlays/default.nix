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

  master-packages = final: _prev: {
    master = import inputs.masterpkgs {
      inherit (final) system;
    };
  };

  snow-packages = final: _prev: {
    snow-overlay = import inputs.snow-nixpkgs {
      inherit (final) system;
    };
  };
}
