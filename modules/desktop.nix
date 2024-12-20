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
      theme = "${import ../home/themes/sddm.nix { inherit pkgs; }}";
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

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "0";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "hyprland";
    GDK_MODULES = "gtk4";
    GDK_BACKEND = "wayland";
    MOZ_DISABLE_RBO = "1";
    MOZ_ENABLE_WAYLAND = "1";
    DOTNET_CLI_TELEMETRY_OPTOUT="1";
    MESA_LOADER_DRIVER_OVERRIDE="nvidia";
    LD_LIBRARY_PATH="${pkgs.wayland}/lib:$LD_LIBRARY_PATH";
    GODOT_DISPLAY_DRIVER="wayland";
    LIBGL_ALWAYS_SOFTWARE="1";
  };

  security.polkit.enable = true;
  programs.dconf.enable = true;
}
