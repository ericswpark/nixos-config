{ lib, pkgs, ... }:
{
  services.wivrn = {
    enable = true;
    openFirewall = true;
    defaultRuntime = true;
    autoStart = true;

    config = {
      enable = true;
      json = {
        scale = 1.0;
        bitrate = 100000000;
        encoders = [
          {
            encoder = "vaapi";
            codec = "h265";
            width = 1.0;
            height = 1.0;
            offset_x = 0.0;
            offset_y = 0.0;
          }
        ];
      };
    };
  };

  # Force WiVRn to take priority if imported with Monado
  environment.etc."xdg/openxr/1/active_runtime.json".source = lib.mkForce "${pkgs.wivrn}/share/openxr/1/openxr_wivrn.json";
}
