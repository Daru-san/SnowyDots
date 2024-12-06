{
  config,
  pkgs,
  inputs,
  system,
  ...
}:
{
  imports = [
    ./extras.nix
    ./starship
    ./nix-index
    ./nu
  ];

  programs.bash = {
    enable = true;
    historyFile = "${config.xdg.dataHome}/bash/history";
    historySize = 10000;
    historyControl = [
      "erasedups"
      "ignorespace"
    ];
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      ${pkgs.trashy}/bin/trashy completions fish | source
      ${pkgs.rqbit}/bin/rqbit -v error completions fish | source
      ${inputs.rimi.packages.${system}.rimi}/bin/rimi completions fish | source
    '';
  };

  # Global shell aliases
  home.shellAliases =
    let
      bat = "${config.programs.bat.package}/bin/bat";
      tty-clock = "${pkgs.tty-clock}/bin/tty-clock";
      trashy = "${pkgs.trashy}/bin/trashy";
      fzf = "${config.programs.fzf.package}/bin/fzf";
    in
    {
      clock = "${tty-clock} -bscBrnS";
      tp = "${trashy} put";
      te = "${trashy} empty";
      tls = "${trashy} list | fzf";
      tres = "trashy-restore";
      tra = "${trashy} restore --all";
      tea = "${trashy} empty --all";
      cat = bat;
      c = "clear";
      trashy-empty = "${trashy} list | ${fzf} --multi | awk '{$1=$1;print}' | rev | cut -d ' ' -f1 | rev | xargs ${trashy} empty --match=exact --force";
      trashy-restore = "${trashy} list | ${fzf} --multi | awk '{$1=$1;print}' | rev | cut -d ' ' -f1 | rev | xargs ${trashy} restore --match=exact --force";
    };
}
