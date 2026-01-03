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
    libGLU
    libGL
    glfw
    steam-run
    mpv
    cmake
    dotnetCorePackages.sdk_9_0_3xx-bin
    dotnetCorePackages.runtime_9_0-bin
    alsa-lib
    alsa-tools
    nix-prefetch-git
    eog
    meslo-lgs-nf
    godot-mono
    gnome-themes-extra
    gimp
    nix-prefetch
    inputs.zen-browser.packages.${pkgs.system}.beta
    killall
    acpi
    brightnessctl
    wev
    powertop
    cpufrequtils
    vesktop
    swaybg
    zulu17
    wireguard-ui
    protonvpn-gui
    easyeffects
    #add new packages above
  ];

  programs.virt-manager.enable = true;
  virtualisation = {
    libvirtd = {
      enable = false;
      nss.enable = true;
      nss.enableGuest = true;
      qemu = {
        swtpm.enable = true;
        runAsRoot = true;
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };

  qt.enable = true;

  hardware.bluetooth.enable = true;

  environment.pathsToLink = [ "/share/zsh" ];
  programs.zsh.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
}
