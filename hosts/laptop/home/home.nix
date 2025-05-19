{ inputs, config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "xfof";
  home.homeDirectory = "/home/xfof";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
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

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/xfof/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  home.enableNixpkgsReleaseCheck = false;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "ALT";
      bind = [
        "$mod, T, exec, kitty"
        "$mod, Z, exec, zen"
        "$mod, Print, exec, hyprshot -m region --clipboard-only"
        "$mod, A, exec, rofi -show drun"
        "$mod, E, togglesplit"
        "$mod, P, workspace, +1"
        "$mod, O, workspace, -1"
        "$mod SHIFT, P, movetoworkspace, +1"
        "$mod SHIFT, O, movetoworkspace, -1"
        "$mod, Q, killactive"
        "$mod, V, togglefloating, 1"
        "$mod, F, fullscreen"
        "$mod, M, exec, ~/.config/eww/scripts/mute.sh"
        "$mod, L, movefocus, r"
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "SUPER, L, movewindow, r"
        "SUPER, H, movewindow, l"
        "SUPER, J, movewindow, d"
        "SUPER, K, movewindow, u"
        ", XF86MonBrightnessUp, exec, brightnessctl s 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      ] ++ (
        builtins.concatLists (builtins.genList (i:
          let
            ws = i + 1;
          in [
            "$mod, ${toString ws}, workspace, ${toString ws}"
            "$mod SHIFT, ${toString ws}, movetoworkspace, ${toString ws}"
          ]
        ) 9)
      );

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      exec-once = [
        "swaybg -i /home/xfof/.config/hypr/wallpapers/paper.jpg"
        "hyprctl setcursor rose-pine-hyprcursor 24"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        ''nix-shell ~/.config/fabric/shell.nix --run "python ~/.config/fabric/bar/bar.py"''
        "sudo powertop --auto-tune"
      ];

      windowrulev2 = [
        "noblur, fullscreen:1"
        "nodim, fullscreen:1"
        "opaque, fullscreen:1"
      ] ++ (
        builtins.concatLists (builtins.map (app:
          [
            "noblur, title:(${app})"
            "nodim, title:(${app})"
            "opaque, title:(${app})"
            "idleinhibit fullscreen, class:(${app})"
            "renderunfocused, class:(${app})"
          ]
        ) ["Zen" "Discord" "rofi" "steam_app" "Godot"])
      );

      monitor = [
        "eDP-1, 1920x1080, 0x1080, 1"
        "HDMI-A-1, 1920x1080, 0x0, 1"
      ];

      env = [
        "HYPRCURSOR_THEME, rose-pine-hyprcursor"
        "HYPRCURSOR_SIZE, 24"
      ];

      decoration = {
        rounding = 6;
        active_opacity = 1.00;
        inactive_opacity = 0.85;
        fullscreen_opacity = 1.0;
        dim_inactive = true;
        dim_strength = 0.25;

        blur = {
          enabled = true;
          size = 10;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          noise = 0.1 ;
          brightness = 0.90;
        };
      };

      general = {
        gaps_in = 3;
        gaps_out = 7;
        gaps_workspaces = 5;
        border_size = 1;
        "col.active_border" = "rgba(3A403DFF)";
        "col.inactive_border" = "rgba(665c5444)";
        resize_on_border = true;
        extend_border_grab_area = 20;
        layout = "dwindle";
      };

      input = {
        kb_layout = "pl";
        kb_options = "grp:caps_toggle";

        touchpad = {
          disable_while_typing = false;
          middle_button_emulation = true;
          tap-to-click = true;
          natural_scroll = true;
        };
      };

      dwindle = {
        preserve_split = true;
      };
    };
  };
}
