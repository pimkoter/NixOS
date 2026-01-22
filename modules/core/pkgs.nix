{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    bat
    blueman
    bottom
    cava
    cmatrix
    curl
    evince
    fastfetch
    ffmpeg
    flatpak
    fzf
    gcc
    gdu # Graphical Disk Usage
    git
    gping # Graphical Ping Utility
    grub2
    greetd
    heroic
    kitty
    lazygit
    nautilus
    neovim
    nh
    obsidian
    pavucontrol
    polkit
    prismlauncher
    qbittorrent
    ripgrep
    spotify
    starship
    steam
    swayidle
    swaylock-effects
    swaynotificationcenter
    thunderbird # Email Client
    vesktop # Discord Client
    wget
    wl-clipboard-rs
    wlogout
    wofi
    xwayland
    xwayland-satellite
    zed-editor

    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
