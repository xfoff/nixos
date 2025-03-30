{self, ...}:
{
  config.globals.mapleader = " ";
  config.opts = {
    #relative line numbers
    number = true;
    relativenumber = true;

    #tab behaviour
    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    smarttab = true;
    smartindent = true;
    expandtab = true;

    #search settings
    hlsearch = false;
    incsearch = true;
    ignorecase = true;
    smartcase = true;
    ruler = true;

    #general options
    mouse = "a";
    signcolumn = "yes";
    undofile = true;
    scrolloff = 8;
    gdefault = true;
    wrap = false;
    updatetime = 50;
    
    clipboard = {
      providers = {
        wl-copy.enable = true;
	      xclip.enable = true;
      };
      register = "unnamedplus";
    };
  };

  config.autoCmd = [
    {
      event = [ "CursorHold" ];
      callback = { __raw = ''function() vim.diagnostic.open_float() end''; };
    }
  ];
}
