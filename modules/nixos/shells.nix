# Shell configurations 
{pkgs, ...}:{
  # Enable zsh
  programs.zsh = {
    enable = true;

    # Colors in ls
    enableLsColors = true;

    # Syntax highlighting
    syntaxHighlighting = {
      enable = true;
    };

    # Autosuggestions
    autosuggestions = {
      enable = true;
    };
  };

  # Enable fish 
  programs.fish.enable = true;

  environment = {
    # Installed shells
    pathsToLink = [ "/share/zsh" "/share/fish" ];
    # GLobal shell aliases
    shellAliases = let
      ranger = "${pkgs.ranger}/bin/ranger";
      rsync = "${pkgs.rsync}/bin/rsync";
    in {
     # Useful shell aliases
      ll = "ls -l";
      ex = "exit";   
      rs = "reset";
      cl = "clear";
      rebootF = "sudo systemctl reboot -f";
      logout = "loginctl terminate-user $USER";

      # Userful rsync aliases
      rsync-copy = "${rsync} -avzhe --progress";
      rsync-move = "${rsync} --remove-source-files -zvh --progress"; 
    
      # Program specific aliases
      r = "${ranger}";

      # cd aliases
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      "......" = "cd ../../../../..";
      "......." = "cd ../../../../../..";
      "........" =  "cd ../../../../../../..";
      "~" = "cd ~";
    };
  };
}
