{ pkgs, lib, ... }:
{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      "$schema" = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json";
      palette = {
        os = "#ACB0BE";
        closer = "p:os";
        pink = "#F4B8E4";
        lavender = "#BABBF1";
        blue =  "#8CAAEE";
      };
      blocks = [
        {
          type = "rprompt";
          alignment = "right";
          segments = [
            {
              type = "time";
              style = "plain";
              foreground = "p:pink";
              properties = {
                time_format = "15:04:05";
              };
            }
          ];
        }
        {
          alignment = "left";
          segments = [
            {
              foreground = "p:os";
              style = "plain";
              template = "{{.Icon}} ";
              type = "os";
            }
            {
              foreground = "p:blue";
              style = "plain";
              template = "{{ .UserName }}@{{ .HostName }} ";
              type = "session";
            }
            {
              foreground = "p:pink";
              properties = {
                folder_icon = "....";
                home_icon = "~";
                style = "agnoster_short";
              };
              style = "plain";
              template = "{{ .Path }} ";
              type = "path";
            }
            {
              foreground = "p:lavender";
              properties = {
                branch_icon = " ";
                cherry_pick_icon = " ";
                commit_icon = " ";
                fetch_status = true;
                fetch_upstream_icon = true;
                merge_icon = " ";
                no_commits_icon = " ";
                rebase_icon = " ";
                revert_icon = " ";
                tag_icon = " ";
              };
              template = "{{ .HEAD }} ";
              style = "plain";
              type = "git";
            }
            {
              style = "plain";
              foreground = "p:closer";
              template = " ";
              type = "text";
            }
          ];
          type = "prompt";
        }
      ];
      final_space = true;
      version = 3;
    };
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
