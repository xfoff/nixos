{ ... }:
{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "catppuccin_frappe";
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
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#laptop --impure";
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
