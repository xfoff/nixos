{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      libglvnd
      egl-wayland
    ];
  };
  programs.turbovnc.ensureHeadlessSoftwareOpenGL = true;

  services.xserver.videoDrivers = ["amd"];
}
