{...}: {
  home.stateVersion = "25.05";

  imports = [
    ./bat.nix
    ./eza.nix
    ./fastfetch.nix
    ./git.nix
    ./kitty.nix
    ./niri.nix
    ./noctalia.nix
    ./nvf.nix
    ./starship.nix
    ./swaylock.nix
    ./wofi.nix
    ./zoxide.nix
    ./zsh.nix
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
