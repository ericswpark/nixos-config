{ ... }:
{
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };

  # Use systemd-resolved
  # See https://github.com/tailscale/tailscale/issues/4254
  services.resolved.enable = true;
}
