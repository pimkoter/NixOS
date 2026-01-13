{
  programs.fastfetch = {
    enable = true;

    settings = {
      display = {
        color = {
          keys = "81"; # mPrimary
          output = "159"; # mTertiary
        };
        separator = " ➜  ";
      };

      logo = {
        type = "kitty-direct";
        height = 8;
        width = 16;
        padding = {
          top = 2;
          left = 2;
        };
      };

      modules = [
        "break"
        {
          type = "kernel";
          key = " ├  ";
          keyColor = "117"; # mSecondary
        }
        {
          type = "packages";
          key = " ├ 󰏖 ";
          keyColor = "117";
        }
        {
          type = "shell";
          key = " └  ";
          keyColor = "117";
        }
        "break"
        {
          type = "wm";
          key = "WM   ";
          keyColor = "117";
        }
        {
          type = "wmtheme";
          key = " ├ 󰉼 ";
          keyColor = "117";
        }
        {
          type = "icons";
          key = " ├ 󰀻 ";
          keyColor = "117";
        }
        {
          type = "cursor";
          key = " ├  ";
          keyColor = "117";
        }
        {
          type = "terminal";
          key = " ├  ";
          keyColor = "117";
        }
        {
          type = "terminalfont";
          key = " └  ";
          keyColor = "117";
        }
        "break"
        {
          type = "host";
          format = "{5} {1} Type {2}";
          key = "PC   ";
          keyColor = "221"; # mError
        }
        {
          type = "cpu";
          format = "{1} ({3}) @ {7} GHz";
          key = " ├  ";
          keyColor = "221";
        }
        {
          type = "gpu";
          format = "{1} {2} @ {12} GHz";
          key = " ├ 󰢮 ";
          keyColor = "221";
        }
        {
          type = "memory";
          key = " ├  ";
          keyColor = "221";
        }
        {
          type = "disk";
          key = " └ 󰋊 ";
          keyColor = "221";
        }

        "break"
        {
          type = "uptime";
          key = "   Uptime   ";
          keyColor = "245"; # mOutline / neutral
        }
      ];
    };
  };
}
