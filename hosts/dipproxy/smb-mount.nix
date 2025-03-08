{ config, pkgs, ... }:
# Requires setting up the service config in rclone beforehand
{
  systemd.user.services.dipper-mount = {
    Unit = {
      Description = "Mount dipper with rclone";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };

    Service =
      let
        # Directory to mount to
        mountDir = "${config.home.homeDirectory}/dipper-mount";
        # Name of service config in rclone
        serviceConfigName = "dipper:";
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
        RestartSec = "5s";
        RestartSteps = "1";
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };
  };
}
