{ lib, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    settings = {
      add_newline = false;
      continuation_prompt = "[▸▹ ](dimmed white)";
      format = lib.concatStrings [
        "$cmd_duration"
        "$shell"
        "$sudo"
        "$username"
        "$directory"
        "$character"
      ];
      command_timeout = 50000;
      right_format = lib.concatStrings [
        "$nix_shell"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$hg_branch"
        "$cmake"
        "$c"
        "$dart"
        "$lua"
        "$rust"
        "$meson"
        "$status"
      ];
      cmd_duration = {
        format = "[$duration]($style) ";
        show_notifications = true;
        min_time_to_notify = 300000;
      };
      git_branch = {
        format = ''[($branch)]($style)'';
      };
      git_status = {
        format = "$all_status$ahead_behind ";
        ahead = "[⬆](bold purple) ";
        behind = "[⬇](bold purple) ";
        staged = "[✚](green) ";
        deleted = "[✖](red) ";
        renamed = "[➜](purple) ";
        stashed = "[✭](cyan) ";
        untracked = "[◼](white) ";
        modified = "[✱](blue) ";
        conflicted = "[═](yellow) ";
        diverged = "⇕ ";
        up_to_date = "";
      };
      git_metrics = {
        format = "([▴ $a dded]($added_style))([▿$del eted]($deleted_style))";
        added_style = "italic dimmed green";
        deleted_style = "italic dimmed red";
        ignore_submodules = true;
        disabled = false;
      };
      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };

      package.disabled = true;
      sudo = {
        format = "[$symbol]($style)";
        style = "bold italic bright-purple";
        symbol = "⋈┈";
        disabled = false;
      };
      nix_shell = {
        style = "bold italic dimmed blue";
        symbol = "✶";
        format = " [$symbol nix⎪$state⎪]($style) [$name](italic dimmed white) ";
        impure_msg = "[⌽](bold dimmed red)";
        pure_msg = "[⌾](bold dimmed green)";
        unknown_msg = "[◌](bold dimmed ellow)";
      };
      lua = {
        format = ''[lua](italic) [''${symbol}''${version}]($style)'';
        version_format = ''''${raw}'';
        symbol = "⨀ ";
        style = "bold bright-yellow";
      };
      rust = {
        format = " [rust](italic) [$symbol$version]($style)";
        symbol = "⊃ ";
        version_format = ''''${raw}'';
        style = "bold red";
      };
      c = {
        symbol = "C ";
        format = " [$symbol($version(-$name))]($style)";
      };
    };
  };
}
