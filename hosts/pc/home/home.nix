{inputs, config, pkgs, ... }:

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

  gtk = {
    enable = true;

    iconTheme = {
      name = "rose-pine-icon-theme";
      package = pkgs.rose-pine-icon-theme;
    };

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    cursorTheme = {
      name = "rose-pine-cursor";
      package = pkgs.rose-pine-cursor;
      size = 24;
    };

    font = {
      name = "MesloLGS NF";
      size = 11;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
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
