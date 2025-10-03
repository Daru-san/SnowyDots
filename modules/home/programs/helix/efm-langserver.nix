{
  xdg.configFile."efm-langserver/config.yaml".text = ''
    version: 2
    #log-file: "/Users/some-user/.config/efm-langserver/log.log"
    #log-level: 2

    languages:
    markdown:
        - lint-command: "markdownlint -s"
        lint-stdin: true
        lint-after-open: true
        lint-on-save: true
        lint-formats:
            - "%f:%l %m"
            - "%f:%l:%c %m"
            - "%f: %l: %m"
  '';
}
