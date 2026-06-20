{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.fetch.homeManagerModules.default];

  programs.fetch = {
    enable = true;
    labelColor = "red";
    speed = 1.0;
    spin = "y";
    info = [
      "os"
      "host"
      "kernel"
      "uptime"
      "packages"
      "shell"
      "wm"
      "font"
      "terminal"
      "cpu"
      "gpu"
      "memory"
      "swap"
      "ip"
      "colors"
    ];
  };
}
