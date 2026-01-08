{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
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

    history = {
      ignoreDups = true;
      save = 10000;
      size = 10000;
    };

    oh-my-zsh = {
      enable = true;
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k-config;
        file = "p10k.zsh";
      }
    ];

    shellAliases = {
      sv = "sudo nvim";
      v = "nvim";
      ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      cat = "bat";
      c = "clear";
      update = "sudo nixos-rebuild test --flake ~/.System/.#NixBTW";
      upgrade = "sudo nixos-rebuild switch --flake ~/.System/.#NixBTW";
      ssn = "sudo systemctl poweroff";
      ssr = "sudo systemctl reboot";
    };
  };
}
