{ pkgs, ... }:
let
  wallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/xfoff/wallpapers/main/invasion.png";
    sha256 = "1s112ra2s22394rjn7lkbgrj21vbdvs896hdqcag0q0nnigdj07j";
  };
in
{
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
            "noblur, class:(${app})"
            "nodim, class:(${app})"
            "opaque, class:(${app})"
            "idleinhibit fullscreen, class:(${app})"
            "renderunfocused, class:(${app})"
          ]
        ) ["zen-beta" "vesktop" "rofi" "steam_app" "godot"])
      );

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
