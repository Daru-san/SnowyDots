# Shell configurations
{pkgs, ...}: {
  # Enable zsh
  programs.zsh = {
    enable = true;

    # Colors in ls
    enableLsColors = true;

    # Syntax highlighting
    syntaxHighlighting = {enable = true;};

    # Autosuggestions
    autosuggestions = {enable = true;};

    # Add bash completion compatibility
    enableBashCompletion = true;
  };

  # Enable fish
  programs.fish.enable = false;

  environment = {
    # Installed shells
    pathsToLink = ["/share/zsh" "/share/fish"];
    # GLobal shell aliases
    shellAliases = let
      yazi = "${config.programs.yazi.package}/bin/yazi";
      rsync = "${pkgs.rsync}/bin/rsync";
    in {
      # Useful shell aliases
      ll = "ls -l";
      xt = "exit";
      rst = "reset";
      clr = "clear";
      shd = "shutdown now";
      rbt = "reboot now";
      rbf = "sudo systemctl reboot -f";
      logout = "loginctl terminate-user $USER";

      # Userful rsync aliases
      rsync-copy = "${rsync} -avzhe --progress";
      rsync-move = "${rsync} --remove-source-files -zvh --progress";

      # Program specific aliases
      y = "${yazi}";

      v = "vi";

      # cd aliases
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      "......" = "cd ../../../../..";
      "......." = "cd ../../../../../..";
      "........" = "cd ../../../../../../..";
      "~" = "cd ~";
    };
  };
}
