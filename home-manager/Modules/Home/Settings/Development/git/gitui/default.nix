{pkgs, config, ...}:{
  programs.gitui = {
    enable = true;
    package = pkgs.unstable.gitui;
    keyConfig = ''

    '';
    theme = ''
          selected_tab: Reset,
          command_fg: White,
          selection_bg: ${config.colorScheme.colors.base05},
          selection_fg: White,
          cmdbar_bg: ${config.colorScheme.colors.base05},
          cmdbar_extra_lines_bg: ${config.colorScheme.colors.base05},
          disabled_fg: ${config.colorScheme.colors.base09},
          diff_line_add: ${config.colorScheme.colors.base08},
          diff_line_delete: Red,
          diff_file_added: LightGreen,
          diff_file_removed: LightRed,
          diff_file_moved: LightMagenta,
          diff_file_modified: ${config.colorScheme.colors.base0B3},
          commit_hash: ${config.colorScheme.colors.base0A},
          commit_time: LightCyan,
          commit_author: Green,
          danger_fg: Red,
          push_gauge_bg: ${config.colorScheme.colors},
          push_gauge_fg: Reset,
          tag_fg: LightMagenta,
          branch_fg: LightYellow,
    '';
  };
}
