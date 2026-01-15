{pkgs, ...}: {
  services = {
    openssh.enable = true;
    upower.enable = true;
    xserver.xkb = {
      layout = "us";
    };
    blueman.enable = true;
    greetd = {
      enable = true;
      restart = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t -r --remember-session";
          user = "greeter";
        };
      };
    };
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
