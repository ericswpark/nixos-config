{ config, pkgs, ... }:

{
  home.username = "ericswpark";
  home.homeDirectory = "/home/ericswpark";

  imports = [
    ./smb-mount.nix
  ];

  # home.packages = with pkgs; [
  # ];

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.sessionVariables.EDITOR = "nvim";
}
