{inputs, ...}: {
  scripts = final: _prev: import inputs.scripts.packages {pkgs = final;};
  packages = final: _prev: import inputs.snowpkgs.packages {pkgs = final;};

  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };
}
