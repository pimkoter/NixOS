{
  services = {
    openssh.enable = true;
    upower.enable = true;
    greetd = {
      enable = true;
    };
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
}
