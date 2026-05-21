{ pkgs, ... }:
{
  services = {
    ollama = {
      enable = true;
      package = pkgs.ollama-vulkan;
      loadModels = [
        "deepseek-r1:1.5b"
        "qwen2:1.5b"
        "mistral:7b"
        "qwen3:1.7b"
        "gemma2:2b"
        "phi3:3.8b"
        "qwen3-vl:2b"
        "llama3.2:3b"
      ];
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
