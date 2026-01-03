{ pkgs, ... }:
{
  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "hyprland";
    GDK_MODULES = "gtk4";
    GDK_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    DOTNET_CLI_TELEMETRY_OPTOUT="1";
    # LD_LIBRARY_PATH="${pkgs.wayland}/lib:${pkgs.nss_latest}/lib:${pkgs.nspr}/lib:${pkgs.xorg.libxkbfile}/lib:$LD_LIBRARY_PATH";
    # GODOT_DISPLAY_DRIVER="wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_9_0_3xx}/share/dotnet/shared/Microsoft.NETCore.App";
    # ANDROID_HOME = "$HOME/Android/Sdk";
  };
}
