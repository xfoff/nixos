{ pkgs, ... }:

{
  imports = [
    ../shared/hyprland.nix
    ../shared/zsh.nix
    ../shared/kitty.nix
    ../shared/rofi.nix
  ];
  home.username = "xfof";
  home.homeDirectory = "/home/xfof";
  home.stateVersion = "25.05";

  programs.zsh.shellAliases = {
    pkgs = "nvim /etc/nixos/hosts/laptop/packages.nix";
    rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#laptop --impure";
  };

  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "eDP-1, 1920x1080, 0x1080, 1"
        "HDMI-A-1, 1920x1080, 0x0, 1"
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

  qt = {
    enable = true;
    platformTheme.name = "adwaita"; 
    style = {
      package = pkgs.catppuccin-qt5ct;
      name = "catppuccin-qt5ct";
    };
  };

  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;
}
