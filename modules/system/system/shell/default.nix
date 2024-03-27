{pkgs, ...}: {
  programs.zsh = {
    enable = true;

    enableLsColors = true;
    syntaxHighlighting = {enable = true;};
    autosuggestions = {enable = true;};
    enableBashCompletion = true;
  };
  programs.fish.enable = false;

  environment = {
    pathsToLink = ["/share/zsh" "/share/fish"];
    shellAliases = let
      # yazi = "${pkgs.}/bin/yazi";
      rsync = "${pkgs.rsync}/bin/rsync";
    in {
      ll = "ls -l";
      ex = "exit";
      r = "reset";
      c = "clear";
      sd = "shutdown now";
      rb = "reboot now";
      rbf = "sudo systemctl reboot -f";
      logout = "loginctl terminate-user $USER";
      rsync-copy = "${rsync} -avzhe --progress";
      rsync-move = "${rsync} --remove-source-files -zvh --progress";
      v = "vi";
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
