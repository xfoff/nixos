{ ... }:
{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    themeFile = "Catppuccin-Mocha";

    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      background_opacity = "0.85";
      background_blur = 5;
    };
  };
}
