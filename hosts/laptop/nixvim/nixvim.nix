{ ... }:
{
  programs.nixvim = {
    enable = true;
    imports = [
      ./plugins.nix
      ./remap.nix
      ./options.nix
    ];

    colorschemes.kanagawa = {
      enable = true;
      settings = {
        compile = false;
        dimInactive = false;
        undercurl = true;
        commentStyle = { italic = true; };
        statementStyle = { bold = true; };
        typeStyle = { bold = true; };
        terminalColors = true;
        theme = "wave";
        background = {
          dark = "dragon"; 
          light = "lotus";
        };
      };
    };
  };
}
