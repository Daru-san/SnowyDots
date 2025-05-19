{inputs,...}:{
    imports = [inputs.chaotic.nixosModules.default];
    chaotic.nyx = {
        cache.enable =true;
        nixPath.enable = true;
        overlay.enable = true;
        registry.enable = true;
    };
}
