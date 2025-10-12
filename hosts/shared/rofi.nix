{ pkgs, config, ... }:
let
  rose-pine = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/rose-pine/rofi/refs/heads/main/rose-pine-moon.rasi";
    sha256 = "191y0nhaqsa5zcrq9axkpgaw1i8yaxr30qi54wa993gnjvm5hxm8";
  };
in
{
  programs.rofi = {
    enable = true;
    cycle = false;
    font = "Figtree 13";
<<<<<<< HEAD
    package = pkgs.rofi;
=======
>>>>>>> 53cb09bc6c6038f6ff5906f4fc221345c4e373ac
    terminal = "${pkgs.zsh}/bin/zsh";
    modes = [ "drun" "calc" "games" ];

    extraConfig = {
      "show-icons" = true;
      "display-drun" = "";
    };

    plugins = with pkgs; [
      rofi-calc
      rofi-games
    ];

  };

  home.file."${config.xdg.configHome}/rofi/config.rasi".text = "${builtins.readFile rose-pine}";
}
