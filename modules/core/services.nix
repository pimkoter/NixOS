{
  services = {
    openssh.enable = true;
    upower.enable = true;
    xserver.xkb = {
      layout = "us";
    };
    blueman.enable = true;
    tailscale = {
      enable = true;
      extraUpFlags = [
        "--netfilter-mode=nodivert"
        "--no-logs-no-support"
      ];
    };
  };
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Service to revive NetworkManager if it dies
  systemd.services.NetworkManager = {
    serviceConfig = {
      Restart = "on-failure";
      RestartSec = 5;
    };
  };
}
