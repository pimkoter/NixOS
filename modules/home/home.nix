{inputs, ...}: {
  imports = [
    ./bat.nix
    ./eza.nix
    ./fastfetch.nix
    ./git.nix
    ./kitty.nix
    ./niri.nix
    ./noctalia.nix
    ./nvf.nix
    ./ollama.nix
    ./starship.nix
    ./tmux.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.stateVersion = "25.05";
  gtk.gtk4.theme = null;
}
