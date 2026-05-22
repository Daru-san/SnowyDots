{
  pkgs,
  lib,
  config,
  ...
}:
let
  inherit (lib)
    mkEnableOption
    mkIf
    mkMerge
    mkPackageOption
    ;
  cfg = config.system.ai;
in
{
  options.system.ai = {
    enable = mkEnableOption "Enable AI through ollama";
    large = mkEnableOption "Enable large (larger than 3b) AI models";
    small = mkEnableOption "Enable small (smaller than 3b) AI models";
    ollama.package = mkPackageOption pkgs "ollama-vulkan" { };
  };
  config = mkIf cfg.enable {
    services = {
      ollama = {
        enable = true;
        package = cfg.ollama.package;
        environmentVariables = {
          GGML_VK_DISABLE_INTEGER_DOT_PRODUCT = "1";
        };
        loadModels = mkMerge [
          [ "phi3:3.8b" ]
          (mkIf cfg.large [
            "mistral:7b"
            "llama3.1:8b"
            "qwen2.5:7b"
            "gemma2:9b"
          ])
          (mkIf cfg.small [
            "llama:3.2:3b"
            "qwen3:1.7b"
            "gemma2:3b"
          ])
        ];
      };
    };

    open-webui = {
      enable = true;
      openFirewall = true;
      host = "0.0.0.0";
      port = 8080;
      environment = {
        HOST = "0.0.0.0";
        PORT = "8080";
        ANONYMIZED_TELEMETRY = "False";
        DO_NOT_TRACK = "True";
        SCARF_NO_ANALYTICS = "True";
        OLLAMA_API_BASE_URL = "http://127.0.0.1:11434/api";
        OLLAMA_BASE_URL = "http://127.0.0.1:11434";
      };
    };
  };
}
