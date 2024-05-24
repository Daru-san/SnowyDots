{config, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    autocd = true;
    dotDir = ".config/zsh";

    historySubstringSearch.enable = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreSpace = true;
      ignoreAllDups = true;
      expireDuplicatesFirst = true;
    };

    zsh-abbr = {
      enable = true;
      abbreviations = {
        gcl = "git clone";
        gbr = "git branch";
        gre = "git remote";
        gst = "git status";
        gps = "git push";
        gpl = "git pull";
        gft = "git fetch";
        grt = "git-root";
        cgrt = "cd-gitroot";
        c = "clear";
        r = "reset";
        nhp = "nohup";
        dtc = "detach";
        hycl = "hyprctl";
        hyprv = "hyprctl version";
        hypr = "Hyprland";
        hyprld = "hyprctl reload";
        rf = "rm -rf";
        tp = "trashy put";
        tls = "trashy list | bat";
        trs = "trashy-restore";
        tra = "trashy restore --all";
        te = "trashy-empty";
        tea = "trashy empty --all";
        yz = "yazi";
        ntc = "nitch";
        lzg = "lazygit";
        g = "git";
        v = "vi";
        nl = "nurl";
        npg = "nix-prefetch-git";
        npgh = "nix-prefetch-github";
        npu = "nix-prefetch-url";
        bs = "bash";
        nflkdl = "nix flake update --commit-lock-file";
        nflkd = "nix flake update";
        ff = "fastfetch";
        nhu = "nh-home-update";
        nsu = "nh-system-update";
        nfp = "nix-flake-push";
      };
    };

    antidote = {
      enable = true;
      useFriendlyNames = true;
      plugins =
        [
          "jimhester/per-directory-history"
          "chisui/zsh-nix-shell"
          "hlissner/zsh-autopair"
          "mollifier/cd-gitroot"
          "Atlas34/fzf-plugin"
          "z-shell/F-Sy-H"
          "romkatv/zsh-bench kind:path"
        ]
        ++ (let
          o = regex: "ohmyzsh/ohmyzsh path:plugins/${regex}";
        in [(o "sudo") (o "extract") (o "cp") (o "adb kind:fpath") (o "vi-mode")]);
    };

    prezto = {
      enable = true;
      caseSensitive = true;
      pmodules = [
        "rsync"
        "archive"
        "command-not-found"
        "completion"
        "directory"
        "git"
        "utility"
      ];
      extraFunctions = ["zcalc"];
    };
  };
}
