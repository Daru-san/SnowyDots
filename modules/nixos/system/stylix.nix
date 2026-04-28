{ inputs, ... }:
{
  imports = [
    inputs.stylix.nixosModules.default
  ];
}
