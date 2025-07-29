{
  config,
  pkgs,
  system,
  inputs,
  osConfig,
  ...
}:
{
  imports = [
    ./extras.nix
    ./starship
    ./nix-index
    ./nix-tools
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
      ${pkgs.codeberg-cli}/bin/berg completion fish | source
      ${pkgs.gtrash}/bin/gtrash completion fish | source
      ${inputs.crimson.packages.${system}.default}/bin/crimson completions fish | source
      source ${pkgs.xmake}/share/xmake/scripts/completions/register-completions.fish
    '';
  };

  # Global shell aliases
  home.shellAliases =
    let
      bat = "${config.programs.bat.package}/bin/bat";
      syst = "${pkgs.systemctl-tui}/bin/systemctl-tui";
    in
    {
      syst = syst;
      cat = bat;
      cgrt = ''cd "$(git rev-parse --show-toplevel)"'';
    }
    // osConfig.environment.shellAliases;
}
