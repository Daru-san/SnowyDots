{pkgs, ...}: {
  programs.zsh = {
    enable = true;

    enableLsColors = true;
    syntaxHighlighting = {enable = true;};
    autosuggestions = {enable = true;};
    enableBashCompletion = true;
  };
  programs.fish = {
    enable = true;
    useBabelfish = true;
  };
  programs = {
    command-not-found.enable = false;
    nix-index = {
      enable = false;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
  environment = {
    pathsToLink = ["/share/zsh" "/share/fish"];
    shellAliases = let
      yazi = "${pkgs.yazi}/bin/yazi";
      rsync = "${pkgs.rsync}/bin/rsync";
      wget2 = "${pkgs.wget2}/bin/wget2";
      gparted = "${pkgs.gparted}/bin/gparted";
      xhost = "${pkgs.xorg.xhost}/bin/xhost";
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
      wget = wget2;
      v = "vi";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      "......" = "cd ../../../../..";
      "......." = "cd ../../../../../..";
      "........" = "cd ../../../../../../..";
      gparted = "${xhost} +SI:localuser:root && ${gparted}";
    };
  };
}
