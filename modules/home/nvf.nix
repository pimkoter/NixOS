{
  inputs,
  config,
  ...
}: {
  imports = [inputs.nvf.homeManagerModules.default];

  programs.nvf = {
    enable = true;

    settings.vim = {
      vimAlias = true;
      viAlias = true;
      withNodeJs = true;
      lineNumberMode = "number";
      enableLuaLoader = true;
      preventJunkFiles = true;

      options = {
        tabstop = 4;
        shiftwidth = 2;
        wrap = false;
      };

      clipboard = {
        enable = true;
        registers = "unnamedplus";
        providers = {
          wl-copy.enable = true;
          xsel.enable = true;
        };
      };

      keymaps = [
        {
          key = "jk";
          mode = ["i"];
          action = "<ESC>";
          desc = "Exit insert mode";
        }
        {
          key = "<leader>nh";
          mode = ["n"];
          action = ":nohl<CR>";
          desc = "Clear search highlights";
        }
        {
          key = "<leader>ff";
          mode = ["n"];
          action = "<cmd>Telescope find_files<cr>";
          desc = "Find files";
        }
        {
          key = "<leader>lg";
          mode = ["n"];
          action = "<cmd>Telescope live_grep<cr>";
          desc = "Search contents";
        }
        {
          key = "<leader>fe";
          mode = ["n"];
          action = "<cmd>Neotree toggle<cr>";
          desc = "Toggle file explorer";
        }
        {
          key = "<leader>t";
          mode = ["n"];
          action = "<cmd>ToggleTerm<CR>";
          desc = "Toggle terminal";
        }
      ];

      diagnostics.enable = true;

      lsp = {
        enable = true;
        formatOnSave = true;
        trouble.enable = true;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;

        nix = {
          enable = true;
          lsp.servers = ["nil"];
        };
      };

      visuals = {
        nvim-web-devicons.enable = true;
        fidget-nvim.enable = true;
        indent-blankline.enable = true;
        rainbow-delimiters.enable = true;
      };

      statusline.lualine = {
        enable = true;
        theme = "base16";
      };

      autopairs.nvim-autopairs.enable = true;
      snippets.luasnip.enable = true;

      filetree.neo-tree.enable = true;
      notify.nvim-notify.enable = true;

      git = {
        enable = true;
        gitsigns.enable = true;
      };

      utility = {
        motion = {
          hop.enable = true;
          leap.enable = true;
        };
      };

      comments.comment-nvim.enable = true;
    };
  };

  home.activation = {
    dirtytalkUpdate = config.lib.dag.entryAfter ["writeBoundary"] ''
      WORDLIST_FILE="$HOME/.config/nvim/spell/programming.utf-8.add"
      if [ ! -f "$WORDLIST_FILE" ]; then
        echo "Downloading programming wordlist..."
        if ${config.programs.nvf.finalPackage}/bin/nvim -c "DirtytalkUpdate" -c "qa!" 2>/dev/null; then
          echo "Done"
        else
          echo "Failed, continuing..." >&2
        fi
      fi
    '';
  };
}
