{
  programs.keepassxc = {
    enable = true;
    settings = {
      Browser.Enabled = true;
      General = {
        BackupBeforeSave = true;

      };
      GUI = {
        AdvancedSettings = true;
        ApplicationTheme = "dark";
        CompactMode = true;
        HidePasswords = true;
        MinimizeOnClose = true;
        MinimizeOnStartup = true;
        MinimizeToTray = true;
        ShowTrayIcon = true;
      };
      Security = {
        IconDownloadFallback = true;
        PasswordEmptyPlaceholder = true;
        Security_HideNotes = true;
      };
      SSHAgent.Enabled = true;
    };
  };
}
