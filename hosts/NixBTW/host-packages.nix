{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vesktop # Discord frontend

    # Gaming
    qbittorrent # Gaming torrent
    heroic # Gamelauncher
  ];
}
