{inputs}: {
  packages = final: _prev: import ../packages {pkgs = final;};
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
  alt-packages = final: _prev: {
    alt = import inputs.nixpkgs-alt {
      inherit (final) system;
    };
  };
}
