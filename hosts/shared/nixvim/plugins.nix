{self, inputs, pkgs, lib, ...}:
{
  plugins = {
    treesitter = {
      enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        c
        cpp
        lua
        nix
        vim
        xml
        css
        tsx
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
        hyprlang
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

        indent.enable = true;
      };

      luaConfig.post = ''
        do
          local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

          parser_config.hyprlang = {
            filetype = "*%hyprland%*",
          }

          vim.filetype.add {
            pattern = {
              ['.*/kitty/*%.conf'] = 'bash',
              ['.*/hypr/.*%.conf'] = 'hyprlang',
              ['*/.*%.gdshader'] = 'gdshader',
            },
          }
        end
      '';
    };

    treesitter-context = {
      enable = true;

      settings = {
        line_numbers = true;
        max_lines = 3;
        min_window_height = 0;
        mode = "cursor";
        multiline_threshold = 20;
        separator = "-";
        trim_scope = "inner";
        zindex = 20;
      };
    };

    treesitter-textobjects = {
      enable = true;

      select = {
        enable = true;
        lookahead = true;
      };

      move = {
        enable = true;
        setJumps = true;
      };

      lspInterop = {
        enable = true;
        border = "rounded";
      };
    };

    lsp = {
      enable = true;
      inlayHints = true;
      
      servers = {
        clangd.enable = true;
        cmake.enable = true;
        omnisharp = {
          enable = true;
          settings = {
            enableEditorConfigSupport = true;
            enableImportCompletion = true;
            enableMsBuildLoadProjectsOnDemand = true;
            sdkIncludePrereleases = true;
          };
        };
        cssls.enable = true;
        glsl_analyzer = {
          enable = true;
          filetypes = [ "vert" "frag" "glsl" ];
        };
        gdscript = {
          enable = true;
          package = null;

          settings = {
            cmd = {
              __raw = ''[[
                local port = os.getenv('GDScript_Port') or "6005"
                local cmd = vim.lsp.rpc.connect('127.0.0.1', port)
                local pipe = '/tmp/godot.pipe'

                vim.lsp.start({
                  name = 'Godot',
                  cmd = cmd,
                  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
                  on_attach = function(client, bufnr)
                    vim.api.nvim_command('echo serverstart("' .. pipe ..'")')
                  end
                })
              ]]'';
            };
          };
        };
        html = {
          enable = true;
          filetypes = [ "html" "tsx" "jsx" "ts" ];
        };
        jsonls.enable = true;
        lua_ls.enable = true;
        nixd.enable = true;
        ts_ls.enable = true;
        pyright.enable = true;
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

    bacon.enable = true;
    conform-nvim = {
      enable = true;
      settings = {formatters_by_ft.rust = ["rustfmt"];};
    };

    rustaceanvim = {
      enable = true;
      settings = {
        tools.enable_clippy = true;
        server = {
          default_settings = {
            inlayHints = {lifetimeElisionHints = {enable = "always";};};
            rust-analyzer = {
              cargo = {allFeatures = true;};
              check = {command = "clippy";};
              files = {excludeDirs = ["target" ".git" ".cargo" ".github" ".direnv"];};
            };
          };
        };
      };
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
    cmp-treesitter.enable = true;

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
      enable = false;
      enableTelescope = true;
      package = pkgs.vimPlugins.harpoon;
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
                    local clients = vim.lsp.get_clients()
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
    dotnet.enable = true;
  };

  extraPlugins = [
  ];
}
