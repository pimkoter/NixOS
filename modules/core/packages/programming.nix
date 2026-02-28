{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Languages
    python315 # Python compiler
    gcc # C / C++ Compiler

    # Network Stuff
    nmap # Network Mapper
    dig # DNS Tester

    # Docker
    compose2nix # Tool for transferring docker-compose.yaml to .nix files
  ];
}
