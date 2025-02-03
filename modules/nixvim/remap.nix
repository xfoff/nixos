{self, ...}:
{
  keymaps = [
    #go to file explorer
    {
      mode = ["v" "n"];
      key = "<leader>fx";
      action = "<cmd>Oil<Cr>";
      options = { silent = true; };
    }

    #move highlighted lines up and down
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options = { silent = true; };
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options = { silent = true; };
    }

    #indenting multiple lines
    {
      mode = ["v" "n"];
      key = "<Tab>";
      action = ">gv";
      options = { silent = true; };
    }
    {
      mode = ["v" "n"];
      key = "<S-Tab>";
      action = "<gv";
      options = { silent = true; };
    }

    #quicksave
    {
      mode = ["v" "n"];
      key = "<leader>w";
      action = "<cmd>w<Cr>";
    }

    #quickleave
    {
      mode = ["v" "n"];
      key = "<leader>q";
      action = "<cmd>q<Cr>";
    }

    #replace string globally
    {
      mode = ["v" "n"];
      key = "<leader>s";
      action = ":%s/<C-R><C-w>/";
    }

    #harpoon keymaps cuz' the options in plugin settings don't work
    {
      mode = ["n"];
      key = "<C-e>";
      action = "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>";
      options = { silent = true; };
    }
    {
      mode = ["n"];
      key = "<leader>a";
      action = "<cmd>lua require('harpoon.mark').add_file()<CR>";
      options = { silent = true; };
    }
    {
      mode = ["n"];
      key = "<C-h>";
      action = "<cmd>lua require('harpoon.ui').nav_file(1)<CR>";
      options = { silent = true; };
    }
    {
      mode = ["n"];
      key = "<C-j>";
      action = "<cmd>lua require('harpoon.ui').nav_file(2)<CR>";
      options = { silent = true; };
    }
    {
      mode = ["n"];
      key = "<C-k>";
      action = "<cmd>lua require('harpoon.ui').nav_file(3)<CR>";
      options = { silent = true; };
    }
    {
      mode = ["n"];
      key = "<C-l>";
      action = "<cmd>lua require('harpoon.ui').nav_file(4)<CR>";
      options = { silent = true; };
    }

    #open telescope
    {
      mode = ["n"];
      key = "<leader>ff";
      action = "<cmd>lua require('telescope.builtin').find_files()<CR>";
    }

    #open undotree
    {
      mode = ["n"];
      key = "<leader>u";
      action = "<cmd>UndotreeShow<CR>";
    }

    #godot shenanigans
    {
      mode = ["n"];
      key = "<leader>g";
      action = "<cmd>GodotRun<CR>";
    }
  ];
}
