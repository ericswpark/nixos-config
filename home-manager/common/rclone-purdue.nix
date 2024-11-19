{ pkgs, ... }:
# Requires setting up the service config in rclone beforehand
{
    systemd.user.services.rclone-purdue-mount = {
        Unit = {
            Description = "Mount Purdue OneDrive with rclone";
            After = [ "network-online.target" ];
            Requires = [ "network-online.target" ];
        };
        Install = {
            WantedBy = [ "default.target" ];
        };

        Service = let
            # Directory to mount to
            mountDir = "/home/ericswpark/OneDrive-Purdue";
            # Name of service config in rclone
            serviceConfigName = "OneDrive-Purdue:";
        in
            {
                Type = "simple";
                ExecStartPre = "/run/current-system/sw/bin/mkdir -p ${mountDir}";
                ExecStart = "${pkgs.rclone}/bin/rclone mount --vfs-cache-mode full ${serviceConfigName} ${mountDir}";
                ExecStop = "/run/current-system/sw/bin/fusermount -u ${mountDir}";
                Restart = "on-failure";
                RestartSec = "10s";
                Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
            };
    };
}