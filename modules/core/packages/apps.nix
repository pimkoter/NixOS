{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    evince # PDF/document viewer
    heroic # Epic/GOG game launcher
    obsidian # Markdown knowledge base
    prismlauncher # Minecraft launcher
    qbittorrent # BitTorrent client
    spotify # Music streaming client
    steam # Steam game platform client
    thunderbird # Email Client
    vesktop # Discord Client
  ];
}
