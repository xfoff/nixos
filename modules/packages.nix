{ inputs, pkgs, ... }:

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
    xclip
    alsa-oss
    alsa-utils
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    hyprcursor
    rose-pine-cursor
    rose-pine-gtk-theme
    rose-pine-icon-theme
    nwg-look
    obs-studio
    zip
    rofi-wayland
    libGLU
    libGL
    python3
    jdk21_headless
    glfw
    pulseeffects-legacy
    privoxy
    steam-run
    exercism
    vesktop
    r2modman
    pulseaudio
    jetbrains-toolbox
    mpv
    cmake
    mono
    cargo
    scons
    pkg-config
    hyprwayland-scanner
    wayland-scanner
    speechd
    libdecor
    egl-wayland
    dotnetCorePackages.dotnet_9.sdk
    dotnetCorePackages.dotnet_9.runtime
    fontconfig
    mesa
    dotnetPackages.Nuget
    #godot_4-mono
    cargo
    alsa-lib
    alsa-utils
    alsa-tools
    aseprite
    espflash
    nix-prefetch-git
    eog
    modrinth-app
    meslo-lgs-nf
    godot_4-mono
    virtualbox
    vmware-workstation
  ];

  programs.firefox = {
    enable = true;
    policies = {
      BlockAboutConfig = false;
      bookmarks = false;
    };
  };

  #virtualbox
  virtualisation.vmware = {
    host = {
      enable = true;
      package = pkgs.vmware-workstation;
      extraPackages = with pkgs; [ open-vm-tools ];
    };
    
    guest = {
      enable = true;
      package = pkgs.open-vm-tools;
    };
  };

  programs.zsh.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
}

