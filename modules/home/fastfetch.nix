{
  programs.fastfetch = {
    enable = true;

    settings = {
      schema = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      logo.padding.top = 1;
      display.separator = "  󰑃  ";

      modules = [
        "break"
        {
          type = "os";
          key = " DISTRO";
        }
        {
          type = "kernel";
          key = "│ ├";
        }
        {
          type = "packages";
          key = "│ ├󰏖";
        }
        {
          type = "command";
          key = "│ ├";
          text = "install=$(stat -c %W /nix); now=$(date +%s); echo $(((now-install)/86400)) days";
        }
        {
          type = "shell";
          key = "│ └";
        }

        {
          type = "wm";
          key = " DE/WM";
        }
        {
          type = "wmtheme";
          key = "│ ├󰉼";
        }
        {
          type = "icons";
          key = "│ ├󰀻";
        }
        {
          type = "cursor";
          key = "│ ├";
        }
        {
          type = "terminalfont";
          key = "│ ├";
        }
        {
          type = "terminal";
          key = "│ └";
        }

        {
          type = "host";
          key = "󰌢 SYSTEM";
        }
        {
          type = "cpu";
          key = "│ ├󰻠";
        }
        {
          type = "gpu";
          key = "│ ├󰻑";
          format = "{2}";
        }
        {
          type = "memory";
          key = "│ ├󰾆";
        }
        {
          type = "uptime";
          key = "│ ├󰅐";
        }
        {
          type = "command";
          key = "STATUS";
          keyColor = "magenta";
          text = ''
            # === Days since last reboot/shutdown or crash ===
            last_shutdown=$(journalctl --list-boots | tail -2 | head -1 | awk '{print $3, $4}')
            if [ -n "$last_shutdown" ]; then
              days=$(( ($(date +%s) - $(date -d "$last_shutdown" +%s)) / 86400 ))
              echo -n "Reboot: $days days │ "
            else
              echo -n "Reboot: N/A │ "
            fi

            crash=$(journalctl -b -1 -o short-unix | grep -m1 "Kernel panic" | cut -d"." -f1)
            if [ -n "$crash" ]; then
              crash_days=$(( ($(date +%s) - $crash) / 86400 ))
              echo -n "Last crash: $crash_days days │ "
            fi

            # === Conditional AUDIO / player / media ===
            if playerctl status 2>/dev/null | grep -q Playing; then
              sink=$(pactl get-default-sink | xargs pactl get-sink-info | awk -F': ' '/Description/{print $2}')
              echo -n " AUDIO: $sink │ "
              track=$(playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null)
              echo -n "󰥠 $track │ "
              album=$(playerctl metadata --format '{{album}}' 2>/dev/null)
              echo -n "󰝚 $album"
            fi
          '';
        }

        "break"
      ];
    };
  };
}
