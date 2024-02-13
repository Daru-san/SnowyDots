{
  outputs,
  inputs,
  ...
}: {
  imports =
    [./home.nix]
    ++ [./themes/default.nix ./wayland/default.nix ./programs/default.nix]
    ++ (with outputs.homeManagerModules; [
      audio
      editor
      programs
      xdg
      wayland
      shell
      themes
    ])
    ++ (with inputs; [
      nur.nixosModules.nur
      spicetify-nix.homeManagerModules.default
      hyprland.homeManagerModules.default
    ]);

  nixpkgs = {
    overlays = [
      # Overlay for stable packages (23.05)
      outputs.overlays.stable-packages

      # Import custom packages
      outputs.overlays.additions

      # Neovim nightly overlay
      inputs.neovim-nightly-overlay.overlays.default
    ];
    config = {
      # Allowing unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;

      # Fix electron packages
      permittedInsecurePackages = ["electron-25.9.0"];
    };
  };
}
