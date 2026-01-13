{...}: {
  home.stateVersion = "25.05";

  imports = [
    ./noctalia.nix
    ./niri/niri.nix
    ./eza.nix
    ./nvf.nix
    ./wofi.nix
    ./fastfetch.nix
    ./kitty.nix
    ./starship.nix
    ./git.nix
    ./zsh.nix
    ./zoxide.nix
  ];

  ########################################
  # 🧬 Git config
  ########################################
  programs = {
    go.enable = true;
    bash.enable = true;
    zoxide.enable = true;
  };

  services.swww.enable = true;
  services.swaync.enable = true;
}
