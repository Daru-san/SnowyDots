{inputs,pkgs, ...}:{
    imports = [inputs.hyprshell.homeModules.default];
    home.packages = [pkgs.hyprshell];
    programs.hyprshell = {
        enable = true;
        package = pkgs.hyprshell;
        systemd.enable = true;
        settings = {
            layerrules = true;
            launcher.enable = false;
            windows = {
                enable = true;
                overview.enable = true;
                switch.enable = true;
            };
        };
    };
}
