{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    git
    vim  
    pipes-rs
    hyprpaper
    swaybg
    swaylock
    swayidle
    unzip
    # gcc
    clang
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
    dotnetCorePackages.dotnet_8.sdk
    dotnetCorePackages.dotnet_8.runtime
    fontconfig
    cargo
    alsa-lib
    alsa-utils
    alsa-tools
    arduino-ide
    nix-prefetch-git
    eog
    meslo-lgs-nf
    godot_4-mono
    godot_4_4-export-templates-bin
    godotPackages_4_4.export-templates-mono-bin
    gnome-themes-extra
    # kdePackages.waylib
    kdePackages.qt6ct
    kdePackages.qtsvg
    kdePackages.qtvirtualkeyboard
    kdePackages.qtmultimedia
    qtemu
    spice
    spice-gtk
    spice-protocol
    nss_latest
    waypipe
    gimp
    qbittorrent
    easyeffects
    zulu21
    nix-prefetch
    inputs.zen-browser.packages.${pkgs.system}.twilight
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
    qmk
    wireguard-ui
    protonvpn-gui
    noip
    android-tools
    openssh
    parted
    noip
    docker-compose
    freerdp
    winboat
    #add new packages above
  ];

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };

  #virtualbox
  programs.virt-manager.enable = false;
  virtualisation = {
    libvirtd = {
      enable = true;
      nss.enable = true;
      nss.enableGuest = true;
      qemu = {
        swtpm.enable = true;
        runAsRoot = true;
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };
    spiceUSBRedirection.enable = true;
    waydroid.enable = true;
    docker = {
      enable = true;
      enableOnBoot = true;
    };
  };
  hardware.nvidia-container-toolkit.enable = true;
  users.groups.libvirtd.members = ["xfof"];

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];

  qt = {
    enable = true;
  };

  environment.pathsToLink = [ "/share/zsh" ];
  programs.zsh.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
}

