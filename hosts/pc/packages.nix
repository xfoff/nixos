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
    #obs-studio
    zip
    rofi-wayland
    libGLU
    libGL
    glfw
    steam-run
    exercism
    vesktop
    r2modman
    jetbrains-toolbox
    mpv
    cmake
    gnumake
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
    arduino-ide
    nix-prefetch-git
    eog
    meslo-lgs-nf
    godot_4-mono
    gnome-themes-extra
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    libsForQt5.qt5.qtwayland
    spice
    spice-gtk
    spice-protocol
    nss_latest
    waypipe
    #(import ../home/Apps/curseforge.nix { inherit pkgs steam-run unzip; })
    gimp
    qbittorrent
    easyeffects
    zulu
    nix-prefetch
    inputs.zen-browser.packages.${pkgs.system}.default
    ollama-cuda
    killall
    inotify-tools
    polkit_gnome
    vintagestory
    icu
    meld
    bash
    libreoffice-qt6-fresh
    gowall
    modrinth-app
    #add new packages above
  ];

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };

  #virtualbox
  programs.virt-manager.enable = true;
  virtualisation = {
    libvirtd = {
      enable = true;
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
    waydroid.enable = true;
  };

  programs.zsh.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
}

