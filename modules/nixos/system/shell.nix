{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    enableLsColors = true;
    syntaxHighlighting = {
      enable = true;
    };
    autosuggestions = {
      enable = true;
    };
    enableBashCompletion = true;
  };
  programs.fish = {
    enable = true;
    promptInit = ''
      ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
    '';
  };
  environment = {
    pathsToLink = [
      "/share/zsh"
      "/share/fish"
    ];
    shellAliases =
      let
        yazi = "${pkgs.yazi}/bin/yazi";
        rsync = "${pkgs.rsync}/bin/rsync";
        wget2 = "${pkgs.stable.wget2}/bin/wget2";
        vim = "${pkgs.neovim}/bin/nvim";
      in
      {
        y = yazi;
        ll = "ls -l";
        ex = "exit";
        r = "reset";
        c = "clear";
        sd = "sudo poweroff -p";
        rb = "sudo reboot --reboot";
        rbf = "sudo reboot -f";
        logout = "loginctl terminate-user $USER";
        rsync-copy = "${rsync} -avzhe --progress";
        rsync-move = "${rsync} --remove-source-files -zvh --progress";
        nix-list = "nix profile history --profile /nix/var/nix/profiles/system";
        wget = wget2;
        tlp-stat = "sudo tlp-stat";
        powertop = "sudo powertop";
        bandwhich = "sudo bandwhich";
        usbtop = "sudo usbtop";
        rv = vim;
        rvi = vim;
        rvim = vim;
        v = "vi";
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";
        "......" = "cd ../../../../..";
        "......." = "cd ../../../../../..";
        "........" = "cd ../../../../../../..";
      };
  };
}
