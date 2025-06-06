{ lib, pkgs, ... }:
{
  services.wivrn = {
    enable = true;
    openFirewall = true;
    defaultRuntime = true;
    autoStart = true;
  };

  # Force WiVRn to take priority if imported with Monado
  environment.etc."xdg/openxr/1/active_runtime.json".source = lib.mkForce "${pkgs.wivrn}/share/openxr/1/openxr_wivrn.json";
}
