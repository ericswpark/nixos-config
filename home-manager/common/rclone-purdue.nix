{ config, pkgs, ... }:
# Requires setting up the service config in rclone beforehand
{
    systemd.user.services.rclone-purdue-mount = {
        Unit = {
            Description = "Mount Purdue OneDrive with rclone";
        };
        Install = {
            WantedBy = [ "default.target" ];
        };

        Service = let
            # Directory to mount to
            mountDir = "${config.home.homeDirectory}/OneDrive-Purdue";
            # Name of service config in rclone
            serviceConfigName = "OneDrive-Purdue:";
        in
            {
                Type = "simple";
                ExecStartPre = [
                    "/run/current-system/sw/bin/nm-online -q"
                    "/run/current-system/sw/bin/mkdir -p ${mountDir}"
                ];
                ExecStart = "${pkgs.rclone}/bin/rclone mount --vfs-cache-mode full --timeout 10s --contimeout 10s ${serviceConfigName} ${mountDir}";
                ExecStop = "/run/current-system/sw/bin/fusermount -uz ${mountDir}";
                Restart = "on-failure";
                Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
            };
    };
}