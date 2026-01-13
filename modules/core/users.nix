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
      ];
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;
    };
  };
}
