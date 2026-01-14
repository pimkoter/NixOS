{
  networking = {
    hostName = "NixBTW";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      checkReversePath = "loose";
    };
  };
}
