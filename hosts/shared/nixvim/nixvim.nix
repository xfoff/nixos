{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    imports = [
      ./plugins.nix
      ./remap.nix
      ./options.nix
    ];

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        disable_underline = true;
        flavour = "mocha";
        integrations = {
          cmp = true;
          gitsigns = true;
          mini = {
            enabled = true;
            indentscope_color = "";
          };
          nvimtree = true;
          treesitter = true;
        };
        styles = {
          booleans = [
            "bold"
            "italic"
          ];
          conditionals = [
            "bold"
          ];
        };
        term_colors = true;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    latexrun
    zathura
  ];
}
