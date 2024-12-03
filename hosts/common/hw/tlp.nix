{ ... }:
{
    services.tlp.enable = true;

    # Conflicts with TLP, explicitly disable
    services.power-profiles-daemon.enable = false;
}