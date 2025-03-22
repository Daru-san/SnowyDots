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

  gimppkgs = final: _prev: {
    gimp3 = import inputs.gimppkgs {
      inherit (final) system;
    };
  };
}
