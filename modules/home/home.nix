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
    ./tmux.nix
    ./wofi.nix
    ./yazi/default.nix
    ./zoxide.nix
    ./zsh.nix
  ];
}
