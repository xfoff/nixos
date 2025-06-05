{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    desktopManager.xfce.enable = true;
  };

  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      wayland.enable = true;
      theme = "${import ./home/themes/sddm.nix { inherit pkgs; }}";
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };

  security.polkit.enable = true;
  programs.dconf.enable = true;
}
