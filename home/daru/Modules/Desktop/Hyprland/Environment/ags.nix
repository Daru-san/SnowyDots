{outputs, pkgs, ...}:{
  # Import the module
  imports = [ outputs.homeManagerModules.ags ];

  # Symlink the configs from my github repo
  # home.file.".config/ags".source = {
  #   pkgs.fetchFromGitHub {
  #     owner = "";
  #     repo = "";
  #     rev = "v${version}";
  #     hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  #   };  
  # };
}
