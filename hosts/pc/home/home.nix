{inputs, config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
  ];
  home.username = "xfof";
  home.homeDirectory = "/home/xfof";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.packages = [
  ];

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

  home.sessionVariables = {
  };

  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;
}
