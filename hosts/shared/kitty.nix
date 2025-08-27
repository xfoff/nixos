{ pkgs, ... }:
let
  rose-pine = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/rose-pine/kitty/refs/heads/main/dist/rose-pine.conf";
    sha256 = "1v9lwrkaxb9yhymj7izr76grn3y857i4bllmdxx0d6ldc9pqdrqg";
  };
in
{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    extraConfig = "
      include ${rose-pine}
    ";

    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      background_opacity = "0.85";
      background_blur = 5;
    };
  };
}
