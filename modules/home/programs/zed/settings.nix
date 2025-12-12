{ lib, ... }:
{
  git = {
    branch_picker = {
      show_author_name = true;
    };
    blame = {
      show_avatar = false;
    };
  };
  preview_tabs = {
    enabled = false;
  };
  window_decorations = "server";
  tabs = {
    show_diagnostics = "off";
    git_status = true;
    file_icons = false;
  };
  terminal = {
    button = true;
  };
  debugger = {
    button = true;
  };
  search = {
    button = true;
  };
  status_bar = {
    active_language_button = true;
  };
  project_panel = {
    button = true;
  };
  title_bar = {
    show_onboarding_banner = false;
    show_user_picture = false;
    show_sign_in = false;
    show_branch_name = true;
  };
  tab_bar = {
    show = true;
  };
  languages = {
    Nix = {
      tab_size = 2;
    };
  };
  diagnostics = {
    inline = {
      enabled = true;
    };
  };
  indent_guides = {
    enabled = true;
  };
  show_whitespaces = "none";
  toolbar = {
    agent_review = false;
    code_actions = true;
    breadcrumbs = true;
  };
  scrollbar = {
    show = "never";
  };
  show_signature_help_after_edits = true;
  auto_signature_help = true;
  buffer_line_height = "comfortable";
  helix_mode = true;
  telemetry = {
    diagnostics = false;
    metrics = false;
  };
  buffer_font_size = lib.mkForce 16;
  disable_ai = true;
  base_keymap = "Atom";
  vim_mode = false;
}
