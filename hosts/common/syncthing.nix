{ config, pkgs, ... }:
{
    services.syncthing = {
        enable = true;
        openDefaultPorts = true;
    };
}
