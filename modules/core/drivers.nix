{config, ...}: {
  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:1:0:0";
        nvidiaBusId = "PCI:0:2:0";
      };
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
