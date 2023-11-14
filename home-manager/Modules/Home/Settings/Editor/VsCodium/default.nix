{config, pkgs, ...}:{
  programs.vscode = { 
    enable = false;
    ##Make the vscode package vscodium
    package = pkgs.vscodium;
    keybindings = [     
    ];

    #The extensions
    extensions = with pkgs.vscode-extensions; [
      shyykoserhiy.vscode-spotify
      xyz.local-history
      github.vscode-github-actions
      yzhang.dictionary-completion
      ms-vscode.cpptools
      esbenp.prettier-vscode
      formulahendry.code-runner
      redhat.java
#      Catppuccin.catppuccin-vsc-icons
      emmanuelbeziat.vscode-great-icons
      emroussel.atomize-atom-one-dark-theme
    ];
  };
}
