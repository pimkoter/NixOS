{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "brackets"
        "pattern"
        "regexp"
        "root"
        "line"
      ];
    };
    historySubstringSearch.enable = true;

    initContent = ''
      # Only run fastfetch if the terminal is NOT a decorative terminal
      if [[ "$TERM_PROGRAM" != "kitty" || "$KITTY_WINDOW_CLASS" != "decor-kitty" ]]; then
          fastfetch
      fi
    '';

    shellAliases = {
      sv = "sudo nvim";
      v = "nvim";
      ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      cat = "bat";
      c = "clear";
      bottom = "btm";
      test = "sudo nixos-rebuild test --flake ~/.System/.#NixBTW";
      update = "cd ~/.System && nix flake update";
      upgrade = "sudo nixos-rebuild switch --flake ~/.System/.#NixBTW";
      ssn = "sudo systemctl poweroff";
      ssr = "sudo systemctl reboot";
      ff = "fastfetch";

      ssh = "kitten ssh";

      ls = "eza";
      lt = "eza --tree --level-2";
      ll = "eza -lh --no-user --long";
      la = "eza -lah";
      tree = "eza --tree";
    };
  };
}
