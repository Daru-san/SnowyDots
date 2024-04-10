{pkgs, ...}: {
  xsession.windowManager.i3.config.bars = [
    {
      position = "top";
      mode = "dock";
      fonts = {
        names = ["JetbrainsMono NF"];
        style = "Bold Semi-Condensed";
        size = 15.5;
      };
      workspaceNumbers = true;
      workspaceButtons = true;
      trayOutput = "primary";
      command = "${pkgs.i3}/bin/i3bar -t";
      statusCommand = "${pkgs.i3status}/bin/i3status";
    }
  ];
}
