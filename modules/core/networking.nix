{
  networking = {
    hostName = "NixBTW";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      checkReversePath = "loose";
    };
    hosts = {
      "192.168.178.10" = ["proxmox"];
      "192.168.178.2" = ["pihole"];
      "192.168.178.3" = [];
      "192.168.178.4" = ["jellyfin"];
    };
  };
}
