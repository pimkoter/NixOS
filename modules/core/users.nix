{pkgs, ...}: {
  users.users = {
    pim = {
      isNormalUser = true;
      description = "Main User";
      hashedPassword = "$6$VrOHvIFjn6HTuxUz$5gp2v0XFmRRx4eOv.X1EDiPXGyUD/OKYVByhUK609iuIZsxzW9l0fkbxmo9w1SNCzxbSD0DAj0gUeNQOSQwJX/";
      extraGroups = [
        "wheel"
        "networkmanager"
        "wireshark"
        "docker"
        "libvirtd"
        "kvm"
      ];
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;
    };
  };
}
