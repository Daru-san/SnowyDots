{inputs, ...}: {
  # Take custom packages from pkgs/packages so they can be accessed using pkgs.(package)
  additions = final: _prev: import ../packages {pkgs = final;};

  # When applied, the stable (23.05) nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.stable'
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };
}
