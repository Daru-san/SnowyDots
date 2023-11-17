#Git config
{config,pkgs,...}:{
  imports = [
    ./gitui/default.nix
  ];
  programs.git = {
    enable = true;
    userName = "Daru-san";
    userEmail = "mica.tui@proton.me";

    #Git aliases
    aliases = {
      ci = "commit";
      co = "checkout";
      cl = "clone";
      st = "status";
      ad = "add";
      ps = "push";
      pl = "pull";
      re = "remote";
      br = "branch";
      fe = "fetch";
      cp = "cherry-pick";
      rs = "reset";
      df = "diff";
      in = "init";
    };
  };
  home.packages = with pkgs; [
      #Git scripts to make editing from any directory easier
      (pkgs.writeShellScriptBin "git-push" ''
        cd ~/snowflake
        git push 
      '')
      (pkgs.writeShellScriptBin "git-ui" ''
        cd ~/snowflake/
        gitui
     '')
      (pkgs.writeShellScriptBin "git-r" ''
        cd ~/snowflake/ 
        ranger
     '')
      (pkgs.writeShellScriptBin "git-alias"''
        print "These are the available git aliases:"
        printf "ci = commit\nco = checkout\ncl = clone\nst = status\nad = add\nps = push\npl = pull\nre = remote\nbr = branch\nfe = fetch\ncp = cherry-pick\nrs = reset\ndf = diff\nin = init\n"
      '')
  ];
}
