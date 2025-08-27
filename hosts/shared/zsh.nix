{ pkgs, lib, ... }:
let
  rose-pine = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/xfoff/nixos/refs/heads/main/hosts/shared/rose-pine-posh.omp.json";
    sha256 = "1knp23vwdf8jq09621xk0bq6v74rf4vfx0ilwwcnk7lppn96fj90";
  };
in
{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "${rose-pine}"));
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    history = {
      expireDuplicatesFirst = true;
      save = 5000;
      size = 5000;
    };

    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "pattern" "regexp" "root" "line" ];
    };

    shellAliases = {
      poweroff = "systemctl poweroff";
      cbonsai = "cbonsai -liL65t0.01";
      run = "java -jar -Xmx16G run.jar nogui";
    };

    oh-my-zsh = {
      enable = true;
      extraConfig = "zstyle ':omz:alpha:lib:git' async-prompt yes";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
