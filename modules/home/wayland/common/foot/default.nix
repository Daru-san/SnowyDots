{
  programs.foot = {
    server.enable = true;
    settings = {
      app-id = "footerm";
      mouse = {
        hide-when-typing = true;
      };
      cursor = {
        style = "block";
        blink = true;
      };
      scrollback = {
        lines = 100 * 10000;
      };
      bell = {
        system = true;
        notify = true;
      };
      security = {
        osc52 = "enabled";
      };
    };
  };
}
