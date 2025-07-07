{
  programs.foot = {
    server.enable = true;
    settings = {
      main = {
        app-id = "footerm";
        term = "xterm-256color";
        workers = 6;
      };
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
      desktop-notifications = {
        command = ''notify-send --wait --app-name ''${app-id} --icon ''${app-id} --category ''${category} --urgency ''${urgency} --expire-time ''${expire-time} --hint STRING:image-path:''${icon} --hint BOOLEAN:suppress-sound:''${muted} --hint STRING:sound-name:''${sound-name} --replace-id ''${replace-id} ''${action-argument} --print-id -- ''${title} ''${body}'';
        command-action-argument = ''--action ''${action-name}=''${action-label}'';
        inhibit-when-focused = true;
      };
    };
  };
}
