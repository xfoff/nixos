{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    git
    vim  
    pipes-rs
    unzip
    gcc
    nodejs_24
    cbonsai
    python3
    hyprshot
    jq
    grim
    slurp
    wl-clipboard
    alsa-oss
    alsa-utils
    rose-pine-hyprcursor
    hyprcursor
    rose-pine-cursor
    rose-pine-gtk-theme
    rose-pine-icon-theme
    nwg-look
    zip
    rofi-wayland
    libGLU
    libGL
    glfw
    steam-run
    jetbrains-toolbox
    mpv
    cmake
    cargo
    scons
    hyprwayland-scanner
    wayland-scanner
    speechd
    egl-wayland
    dotnetCorePackages.dotnet_8.sdk
    dotnetCorePackages.dotnet_8.runtime
    fontconfig
    cargo
    alsa-lib
    alsa-tools
    nix-prefetch-git
    eog
    meslo-lgs-nf
    godot-mono
    gnome-themes-extra
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    libsForQt5.qt5.qtwayland
    spice
    spice-gtk
    spice-protocol
    nss_latest
    waypipe
    gimp
    nix-prefetch
    inputs.zen-browser.packages.${pkgs.system}.twilight
    killall
    inotify-tools
    xorg.libxkbfile
    modrinth-app-unwrapped
    acpi
    brightnessctl
    wev
    powertop
    cpufrequtils
    gnumake
    freetype
    nix-prefetch
    vesktop
    openra
    dwarf-fortress
    jetbrains.rider
    swaybg
    hypridle
    #add new packages above
  ];

  programs.virt-manager.enable = false;
  virtualisation = {
    libvirtd = {
      enable = false;
      nss.enable = true;
      nss.enableGuest = true;
      qemu = {
        swtpm.enable = true;
        runAsRoot = true;
        ovmf.enable = true;
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };
    spiceUSBRedirection.enable = true;
    waydroid.enable = false;
  };

  environment.pathsToLink = [ "/share/zsh" ];
  programs.zsh.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
}
