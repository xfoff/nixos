{self, pkgs, lib, ...}:
{
  plugins = {
    treesitter = {
      enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        c
        cpp
        lua
        nix
        vim
        xml
        css
        scss
        bash
        json
        make
        toml
        yaml
        yuck
        html
        http
        rust
        regex
        vimdoc
        python
        kconfig
        c_sharp
        gdscript
        gdshader
        markdown
        typescript
        javascript
        ssh_config
        git_config
        editorconfig
        godot_resource
      ];
      
      settings = {
        auto_install = false;

        highlight = {
          enable = true;
          additional_vim_regex_highlighting = true;
        };
      };
    };

    lsp = {
      enable = true;
      inlayHints = true;
      
      servers = {
        clangd.enable = true;
        cmake.enable = true;
        csharp_ls = {
          enable = true;
        };
        cssls.enable = true;
        emmet_ls.enable = true;
        glsl_analyzer = {
          enable = true;
          filetypes = [ "gdshader" "vert" "frag" ];
        };
        gdscript = {
          enable = false;
          package = pkgs.vimPlugins.nvim-treesitter-parsers.gdscript;
        };
        gdshader_lsp = {
          enable = false;
          package = (import ./language-servers/gdshader.nix {inherit pkgs lib; });
          filetypes = [ "gdshader" ];
        };
        html = {
          enable = true;
          filetypes = [ "html" "tsx" "jsx" ];
        };
        jsonls = {
          enable = true;
          filetypes = [ "json" "conf" ];
        };
        lua_ls.enable = true;
        nixd.enable = true;
        pyright.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        ts_ls.enable = true;
      };
    };

    lsp-signature = {
      enable = true;

      settings = {
        handler_opts = {
          border = "rounded";
        };

        hint_prefix = {
          above = "↙ ";
          current = " ";
          below = "↖ ";
        };

        bind = true;
        wrap = true;
        transparency = 15;
        hint_enable = true;
        hint_scheme = "strong";
        max_width = 120;
        padding = "|";
      };
    };

    lspkind = {
      enable = true;
      cmp.enable = true;
    };

    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];

        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item(cmp_select)";
          "<C-p>" = "cmp.mapping.select_prev_item(cmp_select)";
          "<C-y>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete()";
        };

        snippet = {
          expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        };
      };
    };
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;

    luasnip = {
      enable = true;

      settings = {
        enable_autosnippets = true;
        exit_roots = false;
        keep_roots = true;
        link_roots = true;
        update_events = [
          "TextChanged"
          "TextChangedI"
        ];
      };
    };

    harpoon = {
      enable = true;
    };

    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        file-browser.enable = true;
      };

      settings = {
        defaults = {
          file_ignore_patterns = [
            "^.git/"
            "^.mypy_cache/"
            "^__pycache__/"
            "^output/"
            "^data/"
            "^node_modules/"
            "^build/"
            "^dist/"
          ];
          layout_config = {
            prompt_position = "top";
          };
          selection_caret = "> ";
          set_env = {
            COLORTERM = "truecolor";
          };
          sorting_strategy = "ascending";
        };
      };
    };
    web-devicons.enable = true;

    oil = {
      enable = true;

      settings = {
        columns = [
          "icon"
        ];
        keymaps = {
          "<C-r>" = "actions.refresh";
          "<leader>qq" = "actions.close";
          "<C-y>" = "actions.copy_entry_path";
        };
        skip_confirm_for_simple_edits = true;
        view_options = {
          show_hidden = false;
        };
        win_options = {
          concealcursor = "ncv";
          conceallevel = 3;
          cursorcolumn = false;
          foldcolumn = "0";
          signcolumn = "no";
          spell = false;
          wrap = false;
        };
      };
    };

    comment = {
      enable = true;

      settings.toggler = {
        line = "<leader><leader>";
      };
    };

    lualine = {
      enable = true;
      settings = {
        options = {
          icons_enable = true;
          theme = "horizon";
          component_separators = { left = ""; right = ""; };
          section_separators = { left = ""; right = ""; };
          always_divide_middle = true;
          always_show_tabline = true;
          globalstatus = false;
        };

        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [ "filename" "diagnostics" ];
          lualine_c = [ "branch" "diff" ];
          lualine_x = [
            {
              __unkeyed-1 = {
                __raw = ''
                  function()
                    local msg = ""
                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                      return msg
                    end
                    for _, client in ipairs(clients) do
                      local filetypes = client.config.filetypes
                      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                      end
                    end
                    return msg
                  end
                '';
              };
              color = {
                fg = "#ffffff";
              };
              icon = "";
            }
            "filetype"
          ];
        };
      };
    };

    undotree = {
      enable = true;

      settings = {
        CursorLine = true;
        DiffAutoOpen = true;
        DiffCommand = "diff";
        DiffpanelHeight = 10;
        HelpLine = true;
        HighlightChangedText = true;
        HighlightChangedWithSign = true;
        HighlightSyntaxAdd = "DiffAdd";
        HighlightSyntaxChange = "DiffChange";
        HighlightSyntaxDel = "DiffDelete";
        RelativeTimestamp = true;
        SetFocusWhenToggle = true;
        ShortIndicators = false;
        SplitWidth = 40;
        TreeNodeShape = "*";
        TreeReturnShape = "\\";
        TreeSplitShape = "/";
        TreeVertShape = "|";
        WindowLayout = 4;
      };
    };

    godot = {
      enable = true;
      settings.executable = "${pkgs.godot_4-mono}/bin/godot4-mono";
    };

    ts-autotag.enable = true;
  };

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "smear-cursor";
      src = pkgs.fetchFromGitHub {
        owner = "sphamba";
        repo = "smear-cursor.nvim";
        rev = "4b7334a09cd2434e73588cc0ea63e71177251249";
        hash = "sha256-2ewfzlqYUjUYfCcOOP3CQclW/eIIzgk0TrFxbcrUaqs=";
      };
    })
  ];
}
