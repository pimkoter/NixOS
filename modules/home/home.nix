{...}: {
  home.stateVersion = "25.05";

  imports = [
    ./bat.nix
    ./eww.nix
    ./eza.nix
    ./fastfetch.nix
    ./git.nix
    ./kitty.nix
    ./niri.nix
    ./noctalia.nix
    ./nvf.nix
    ./starship.nix
    ./tmux.nix
    ./zoxide.nix
    ./zsh.nix
  ];
}
