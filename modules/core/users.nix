{pkgs, ...}: {
  users.users = {
    pim = {
      isNormalUser = true;
      description = "Main User";
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
