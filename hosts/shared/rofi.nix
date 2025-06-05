{ pkgs, config, ... }:
{
  programs.rofi = {
    enable = true;
    cycle = false;
    font = "Figtree 13";
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.zsh}/bin/zsh";
    modes = [ "drun" ];

    extraConfig = {
      "show-icons" = true;
      "display-drun" = "";
    };

    plugins = [
      pkgs.rofi-calc
      pkgs.rofimoji
      pkgs.rofi-bluetooth
    ];

  };

  home.file."${config.xdg.configHome}/rofi/config.rasi".text = ''
    * {
      g-spacing: 10px;
      g-margin: 0;
      b-color: #232136;
      fg-color: #3e8fb0;
      fgp-color: #0f2027FF;
      b-radius: 8px;
      g-padding: 8px;
      hl-color: #3e8fb0;
      hlt-color: #E8E6E3FF;
      alt-color: #1b2735FF;
      wbg-color: #0f2027FF;
      w-border: 2px solid;
      w-border-color: #232136;
      w-padding: 12px;
    }

    listview {
      columns: 1;
      lines: 7;
      fixed-height: true;
      fixed-columns: true;
      cycle: false;
      scrollbar: false;
      border: 0px solid;
    }

    window {
      transparency: "real";
      width: 450px;
      border-radius: @b-radius;
      background-color: @wbg-color;
      border: @w-border;
      border-color: @w-border-color;
      padding: @w-padding;
    }

    prompt {
      text-color: @fg-color;
    }

    inputbar {
      children: ["prompt", "entry"];
      spacing: @g-spacing;
    }

    entry {
      placeholder: "Search Apps";
      text-color: @fg-color;
      placeholder-color: @fgp-color;
    }

    mainbox {
      spacing: @g-spacing;
      margin: @g-margin;
      padding: @g-padding;
      children: ["inputbar", "listview", "message"];
    }

    element {
      spacing: @g-spacing;
      margin: @g-margin;
      padding: @g-padding;
      border: 0px solid;
      border-radius: @b-radius;
      border-color: @b-color;
      background-color: transparent;
      text-color: @fg-color;
    }

    element normal.normal {
      background-color: transparent;
      text-color: @fg-color;
    }

    element alternate.normal {
      background-color: @alt-color;
      text-color: @fg-color;
    }

    element selected.active {
      background-color: @hl-color;
      text-color: @hlt-color;
    }

    element selected.normal {
      background-color: @hl-color;
      text-color: @hlt-color;
    }

    message {
      background-color: @hlt-color;
      text-color: @hlt-color;
      border: 0px solid;
      border-radius: @b-radius;
      padding: @g-padding;
    }
  '';
}
