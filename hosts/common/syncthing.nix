{ config, pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "ericswpark";
    dataDir = "/home/ericswpark/Syncthing";
    extraFlags = [ "--no-default-folder" ]; # Don't create default ~/Sync folder
  };
}
