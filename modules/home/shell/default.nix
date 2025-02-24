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
      ${pkgs.rqbit}/bin/rqbit -v error completions fish | source
      ${inputs.rimi.packages.${system}.rimi}/bin/rimi completions fish | source
      ${pkgs.codeberg-cli}/bin/berg completion fish | source
      ${pkgs.gtrash}/bin/gtrash completion fish | source
    '';
  };

  # Global shell aliases
  home.shellAliases =
    let
      bat = "${config.programs.bat.package}/bin/bat";
      tty-clock = "${pkgs.tty-clock}/bin/tty-clock";
      syst = "${pkgs.systemctl-tui}/bin/systemctl-tui";
      wget2 = "${pkgs.wget2}/bin/wget2";
    in
    {
      syst = syst;
      clock = "${tty-clock} -bscBrnS";
      cat = bat;
      c = "clear";
      cgrt = ''cd "$(git rev-parse --show-toplevel)"'';
      wget = wget2;
    };
}
