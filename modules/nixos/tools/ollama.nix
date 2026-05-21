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
    nextjs-ollama-llm-ui = {
      enable = true;
    };
  };
}
