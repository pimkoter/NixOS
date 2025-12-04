{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    #QOL
    vesktop # Discord frontend
    spotify # Music client

    # Gaming
    qbittorrent # Gaming torrent
    heroic # Gamelauncher
  ];
}
