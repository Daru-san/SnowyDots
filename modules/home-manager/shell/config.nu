let base00 = "#181818"
let base01 = "#282828"
let base02 = "#383838"
let base03 = "#585858"
let base04 = "#b8b8b8"
let base05 = "#d8d8d8"
let base06 = "#e8e8e8"
let base07 = "#f8f8f8"
let base08 = "#ab4642"
let base09 = "#dc9656"
let base0a = "#f7ca88"
let base0b = "#a1b56c"
let base0c = "#86c1b9"
let base0d = "#7cafc2"
let base0e = "#ba8baf"
let base0f = "#a16946"

let base16_theme = {
  separator: $base03
  leading_trailing_space_bg: $base04
  header: $base0b
  date: $base0e
  filesize: $base0d
  row_index: $base0c
  bool: $base08
  int: $base0b
  duration: $base08
  range: $base08
  float: $base08
  string: $base04
  nothing: $base08
  binary: $base08
  cellpath: $base08
  hints: dark_gray

  shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
  shape_bool: $base0d
  shape_int: { fg: $base0e attr: b}
  shape_float: { fg: $base0e attr: b}
  shape_range: { fg: $base0a attr: b}
  shape_internalcall: { fg: $base0c attr: b}
  shape_external: $base0c
  shape_externalarg: { fg: $base0b attr: b}
  shape_literal: $base0d
  shape_operator: $base0a
  shape_signature: { fg: $base0b attr: b}
  shape_string: $base0b
  shape_filepath: $base0d
  shape_globpattern: { fg: $base0d attr: b}
  shape_variable: $base0e
  shape_flag: { fg: $base0d attr: b}
  shape_custom: {attr: b}
}
let carapace_completer = {|spans|
  carapace $spans.0 nushell $spans | from json
}
$env.config = {
  edit_mode: vi
  show_banner: false
  filesize_metric: true
  use_ls_colors: true
  use_ansi_coloring: true
  animate_prompt: false
  color_config: $base16_theme
  completions: {
    case_sensitive: false
    quick: true
    partial: true
    algorithm: "fuzzy"
    external: {
      enable: true
      max_results: 100
      completer: $carapace_completer # check 'carapace_completer'
    }
  }
}
$env.PATH = ($env.PATH |
  split row (char esep) |
  append /usr/bin/env
)
