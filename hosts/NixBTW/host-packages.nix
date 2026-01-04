{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    discord # Discord Frontend
    spotify # Music Player
    qbittorrent # Torenting App
    heroic # Game Launcher
  ];
}
