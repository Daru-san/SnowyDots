{pkgs, ...}: {
  programs.zsh = {
    enable = true;

    enableLsColors = true;
    syntaxHighlighting = {enable = true;};
    autosuggestions = {enable = true;};
    enableBashCompletion = true;
  };
  programs = {
    command-not-found.enable = false;
    nix-index = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
  environment = {
    pathsToLink = ["/share/zsh" "/share/fish"];
    shellAliases = let
      yazi = "${pkgs.yazi}/bin/yazi";
      rsync = "${pkgs.rsync}/bin/rsync";
    in {
      y = yazi;
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
      nix-list = "nix profile history --profile /nix/var/nix/profiles/system";
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
