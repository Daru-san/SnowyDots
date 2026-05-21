{
  services = {
    ollama = {
      enable = true;
      loadModels = [
        "gpt-oss:1.5b"
        "deepseek-r1:1.5b"
        "qwen2:1.5b"
        "mistral:7b"
        "qwen3:1.7b"
        "gemma2:2b"
      ];
    };
    nextjs-ollama-llm-ui = {
      enable = true;
    };
  };
}
