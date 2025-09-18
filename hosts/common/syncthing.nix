{ config, pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "ericswpark";
    dataDir = "/home/ericswpark/Syncthing";
  };
}
