let carapace_completer = {|spans|
  carapace $spans.0 nushell $spans | from json
}
$env.config = {
  edit_mode: vi
  show_banner: false

  completions: {
    case_sensitive: false
    quick: true
    partial: true
    algorithm: "fuzzy"
    external: {
      enable: true
      max_results: 100
      completer: $carapace_completer # check 'carapace_completer
    }
  }
}
$env.PATH = ($env.PATH |
  split row (char esep) |
  append /usr/bin/env
)
