{
  services = {
    ollama = {
      enable = false;
      loadModels = [
        "gpt-oss:20b"
        "deepseek-r1:latest"
      ];
    };
    nextjs-ollama-llm-ui = {
      enable = false;
    };
  };
}
