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
        syst = "systemctl-tui";
        g = "git";
        v = "vi";
        nl = "nurl";
        npg = "nix-prefetch-git";
        npgh = "nix-prefetch-github";
        npu = "nix-prefetch-url";
        bs = "bash";
        nfdl = "nix flake update --commit-lock-file";
        nfd = "nix flake update";
        nbld = "nix build";
        nsh = "nix shell";
        nfl = "nix flake";
        nup = "nix-update";
        nrv = "nixpkgs-review";
        nit = "nix-init";
        nmt = "nix-fmt";
        nhc = "nh clean";
        ff = "fastfetch";
        nhu = "nh-home-upgrade";
        nsu = "nh-system-upgrade";
        nfu = "nh-full-upgrade";
        nfp = "nix-flake-push";
        nos = "nh os switch -- -j 8 --keep-going --cores 6";
        nhs = "nh home switch -- -j 8 --keep-going --cores 6";
        nfs = "nh-full-switch";
        nob = "nh os boot -- -k8 --keep-going --cores 6";
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
        "completion"
        "directory"
        "git"
        "utility"
      ];
      extraFunctions = ["zcalc"];
    };
  };
}
