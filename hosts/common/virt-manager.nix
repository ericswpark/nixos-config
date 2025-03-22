{ ... }:
{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["ericswpark"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}