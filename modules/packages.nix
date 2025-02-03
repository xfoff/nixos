{ inputs, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    xterm
    wget
    git
    vim  
    pipes-rs
    hyprpaper
    swaybg
    swaylock
    swayidle
    neovim
    unzip
    gcc
    nodejs_22
    eww
    cbonsai
    python3
    hyprshot
    jq
    grim
    slurp
    wl-clipboard
    alsa-oss
    alsa-utils
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    hyprcursor
    rose-pine-cursor
    rose-pine-gtk-theme
    rose-pine-icon-theme
    catppuccin-qt5ct
    nwg-look
    obs-studio
    zip
    rofi-wayland
    libGLU
    libGL
    python3
    glfw
    steam-run
    exercism
    vesktop
    r2modman
    pulseaudio
    jetbrains-toolbox
    mpv
    cmake
    cargo
    scons
    hyprwayland-scanner
    wayland-scanner
    speechd
    egl-wayland
    #dotnetCorePackages.dotnet_9.sdk
    #dotnetCorePackages.dotnet_9.runtime
    dotnetCorePackages.dotnet_8.sdk
    dotnetCorePackages.dotnet_8.runtime
    fontconfig
    cargo
    alsa-lib
    alsa-utils
    alsa-tools
    aseprite
    espflash
    nix-prefetch-git
    eog
    meslo-lgs-nf
    godot_4-mono
    gnome-themes-extra
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    spice
    spice-gtk
    spice-protocol
    modrinth-app
    nss_latest
    waypipe
    #(import ../home/Apps/curseforge.nix { inherit pkgs steam-run unzip; })
    gimp
    qbittorrent
    easyeffects
    zulu
    nix-prefetch
<<<<<<< HEAD
    inputs.zen-browser.packages.${pkgs.system}.specific
=======
    inputs.zen-browser.packages.${pkgs.system}.twilight
>>>>>>> 107c091 (added all the goodies)
    #add new packages above
  ];

  #virtualbox
  virtualisation = {
    spiceUSBRedirection.enable = true;
    vmware.host.enable = true;
    vmware.guest.enable = true;
  };

  programs.zsh.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
}

