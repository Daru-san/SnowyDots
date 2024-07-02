{inputs, ...}: {
  imports = [inputs.nyx.nixosModules.default];
  chaotic.nyx.cache.enable = true;
}
