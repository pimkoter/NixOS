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
      if [[ $- == *i* ]] && [[ -z "$DECOR_KITTY" ]]; then
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
      update = "cd ~/.System && nix flake update && sudo nixos-rebuild switch --upgrade --flake .#NixBTW";
      upgrade = "sudo nixos-rebuild switch --flake ~/.System/.#NixBTW";
      ssn = "sudo systemctl poweroff";
      ssr = "sudo systemctl reboot";
      ff = "fastfetch";
      gens = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";

      ssh = "kitten ssh";

      ls = "eza";
      lt = "eza --tree --level-2";
      ll = "eza -lh --no-user --long";
      la = "eza -lah";
      tree = "eza --tree";
    };
  };
}
