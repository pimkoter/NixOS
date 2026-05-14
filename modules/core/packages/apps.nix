{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    evince # PDF/document viewer
    heroic # Epic/GOG game launcher
    legcord # Discord client
    obsidian # Markdown knowledge base
    prismlauncher # Minecraft launcher
    qbittorrent # BitTorrent client
    satisfactorymodmanager # Modmanager for satisfactory
    spotify # Music streaming client
    steam # Steam game platform client
    thunderbird # Email Client
    winboat # Windows emulation software

    inputs.helium-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
