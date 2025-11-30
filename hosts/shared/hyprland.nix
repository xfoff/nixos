{ pkgs, ... }:
let
  wallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/xfoff/wallpapers/main/rose-pine-squigly.jpg";
    sha256 = "1ywgki29zmiq3szx4x5nvb3z7a73csc369jx8gb7ia8vsyiy041q";
  };

  rose-pine = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/rose-pine/hyprland/refs/heads/main/rose-pine.conf";
    sha256 = "0q4zna3njimn2ffaincjcxyiyx8qlz625q6n4k3qbxwqbmvdlcc2";
  };
in
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      source = "${rose-pine}";

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
        "$mod, C, exec, rofi -show calc -modi calc -no-show-match -no-sort"
        "SUPER, L, movewindow, r"
        "SUPER, H, movewindow, l"
        "SUPER, J, movewindow, d"
        "SUPER, K, movewindow, u"
        ", XF86MonBrightnessUp, exec, brightnessctl s 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
        "$mod, Escape, exec, systemctl suspend"
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
        "swaybg -i ${wallpaper}"
        "hyprctl setcursor rose-pine-hyprcursor 24"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        "sudo powertop --auto-tune"
        "[workspace 11 silent] protonvpn-app"
      ];

      windowrulev2 = [
        "noblur, fullscreen:1"
        "nodim, fullscreen:1"
        "opaque, fullscreen:1"
      ] ++ (
        builtins.concatLists (builtins.map (app:
          [
            "nodim, class:(${app})"
            "idleinhibit fullscreen, class:(${app})"
            "renderunfocused, class:(${app})"
          ]
        ) ["zen-beta" "zen-twilight" "rofi" "steam_app"])
      );

      env = [
        "HYPRCURSOR_THEME, rose-pine-hyprcursor"
        "HYPRCURSOR_SIZE, 24"
      ];

      decoration = {
        rounding = 6;
        active_opacity = 0.9;
        inactive_opacity = 0.9;
        fullscreen_opacity = 1.0;
        dim_inactive = true;
        dim_strength = 0.4;

        blur = {
          enabled = true;
          size = 10;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          noise = 0.1;
          brightness = 0.90;
        };
      };

      general = {
        gaps_in = 4;
        gaps_out = 7;
        gaps_workspaces = 5;
        border_size = 2;
        "col.active_border" = "$rose $pine $love $iris 90deg";
        "col.inactive_border" = "$muted";
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

  gtk = {
    enable = true;

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
}
