{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    bat # cat clone with syntax highlighting
    blueman # Bluetooth manager GUI
    bottom # System monitor (htop-like)
    cava # Terminal audio visualizer
    cmatrix # Matrix-style terminal screensaver
    curl # Command-line HTTP client
    evince # PDF/document viewer
    fastfetch # System info fetch tool
    ffmpeg # Audio/video processing toolkit
    fzf # Fuzzy finder
    gcc # GNU C/C++ compiler
    git # Version control system
    gping # Graphical Ping Utility
    grub2 # Bootloader
    heroic # Epic/GOG game launcher
    kitty # GPU-accelerated terminal emulator
    lazygit # TUI Git client
    neovim # Vim-based text editor
    nh # NixOS helper for rebuilds and channels
    obsidian # Markdown knowledge base
    pavucontrol # PulseAudio/pipewire volume control GUI
    polkit # Authorization framework
    prismlauncher # Minecraft launcher
    qbittorrent # BitTorrent client
    ripgrep # Fast recursive search (grep alternative)
    spotify # Music streaming client
    starship # Cross-shell prompt
    steam # Steam game platform client
    thunderbird # Email Client
    vesktop # Discord Client
    wget # Command-line file downloader
    wl-clipboard-rs # Wayland clipboard utilities (wl-copy/wl-paste)
    xwayland # X11 compatibility layer for Wayland
    xwayland-satellite # Isolated Xwayland helper

    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default # Noctalia Wayland compositor package set
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default # Zen Browser (Firefox-based)
  ];
}
