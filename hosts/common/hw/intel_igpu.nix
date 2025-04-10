{ config, pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      libvdpau-va-gl
      vaapiVdpau
      intel-media-driver
      vaapiIntel
      intel-compute-runtime
    ];
  };
}
