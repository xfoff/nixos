{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
  };
  services.libinput.enable = true;

  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      wayland.enable = true;
      theme = "${import ../shared/sddm.nix { inherit pkgs; }}";
      extraPackages = with pkgs; [
        kdePackages.waylib
        kdePackages.qt6ct
        kdePackages.qtsvg
        kdePackages.qtvirtualkeyboard
        kdePackages.qtmultimedia
        qtemu
      ];
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
    config = {
      hyprland.preferred = [ "hyprland" "gtk" ];
    };
  };

  security.polkit.enable = true;
  programs.dconf.enable = true;
}
