{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # School
    python315
    gcc
  ];
}
