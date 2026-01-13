{...}: {
  services = {
    openssh.enable = true;
    upower.enable = true;
    displayManager = {
      enable = true;
      ly.enable = true;
    };
    xserver.xkb = {
      layout = "us";
    };
    blueman.enable = true;
  };
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
