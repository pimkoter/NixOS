{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    legcord # Discord Frontend
    spotify # Music Player
    qbittorrent # Torenting App
    heroic # Game Launcher
    satisfactorymodmanager # Mod manager for satisfactory
  ];
}
