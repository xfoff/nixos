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
    nodejs_23
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
    #godot_4-mono
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
    nix-prefetch
    inputs.zen-browser.packages.${pkgs.system}.twilight
    inputs.hyprls.packages.${pkgs.system}.default
    killall
    inotify-tools
    xorg.libxkbfile
    android-tools
    jdk17
    aapt
    (pkgs.callPackage ./packages/supabase-cli.nix {})
    certbot-full
    nginx
    openssl
    #add new packages above
  ];

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
    docker.enable = true;
  };

  programs.zsh.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.nix-ld.enable = true;
}

