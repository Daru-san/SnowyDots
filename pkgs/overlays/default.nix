{inputs}: {
  packages = final: _prev: import ../packages {pkgs = final;};
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };
}
