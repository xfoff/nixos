{pkgs, ... }:

{
  imports = [
    ../../shared/hyprland.nix
    ../../shared/zsh.nix
    ../../shared/kitty.nix
    ../../shared/rofi.nix
  ];

  home.username = "xfof";
  home.homeDirectory = "/home/xfof";
  home.stateVersion = "25.05";

  programs.zsh.shellAliases = {
    pkgs = "nvim /etc/nixos/hosts/pc/packages.nix";
    rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#pc --impure";
  };

  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "DP-1, 1920x1080, 1920x0, 1"
        "DP-2, 1920x1080, 0x0, 1"
      ];
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };

      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
    };
  };

  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;
}
