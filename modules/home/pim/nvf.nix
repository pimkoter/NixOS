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
      autocomplete.nvim-cmp.enable = true;
      telescope.enable = true;

      assistant = {
        copilot = {
          enable = true;
          cmp.enable = true;
        };

        codecompanion-nvim = {
          enable = true;
          setupOpts = {
            interactions = {
              chat = {adapter = "copilot";};
              inline = {adapter = "copilot";};
            };
          };
        };
      };

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

      lsp = {
        enable = true;
        formatOnSave = true;
        trouble.enable = true;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        nix.enable = true;
        yaml.enable = true;
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
}
