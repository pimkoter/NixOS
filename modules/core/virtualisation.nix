{pkgs, ...}: {
  virtualisation.libvirtd.enable = true;

  programs.virt-manager.enable = true;
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    qemu_kvm
    virt-manager
    virt-viewer
    OVMF # UEFI for Windows/Linux
  ];

  # KVM acceleration
  boot.kernelModules = ["kvm-intel"];

  # Optional but recommended
  hardware.graphics.enable = true;
}
