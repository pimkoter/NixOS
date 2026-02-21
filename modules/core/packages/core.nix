{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    bat # cat clone with syntax highlighting
    blueman # Bluetooth manager GUI
    bottom # System monitor (htop-like)
    curl # Command-line HTTP client
    ffmpeg # Audio/video processing toolkit
    fzf # Fuzzy finder
    git # Version control system
    grub2 # Bootloader
    kitty # GPU-accelerated terminal emulator
    lazygit # TUI Git client
    neovim # Vim-based text editor
    pavucontrol # PulseAudio/pipewire volume control GUI
    polkit # Authorization framework
    ripgrep # Fast recursive search (grep alternative)
    starship # Cross-shell prompt
    wl-clipboard-rs # Wayland clipboard utilities (wl-copy/wl-paste)
    xwayland # X11 compatibility layer for Wayland
    xwayland-satellite # Isolated Xwayland helper

    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default # Noctalia Wayland compositor package set
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default # Zen Browser (Firefox-based)
  ];
}
