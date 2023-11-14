{pkgs, inputs, anyrun, ...}:{
  imports = [ anyrun.homeManagerModules.default ];
  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
        "${inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins}"
      ];
      width = { fraction = 0.3; };
      # position = "center";
      # verticalOffset = { absolute = 0; };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;
    };
    extraCss = ''
    '';

    # extraConfigFiles."some-plugin.ron".text = ''
    #   Config(
    #     // for any other plugin
    #     // this file will be put in ~/.config/anyrun/some-plugin.ron
    #     // refer to docs of xdg.configFile for available options
    #   )
    # '';
  };
  # nix.settings = {
  #   builders-use-substitutes = true;
  #   # substituters to use
  #   substituters = [
  #       "https://anyrun.cachix.org"
  #   ];
  #
  #   trusted-public-keys = [
  #       "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
  #   ];
  # };
}
