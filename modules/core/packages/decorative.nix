{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cava # Terminal audio visualizer
    cmatrix # Matrix-style terminal screensaver
    fastfetch # System info fetch tool
    gping # Graphical Ping Utility
  ];
}
