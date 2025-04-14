# Set ZSH as system-wide login shell
# For configuration, set up with home-manager
{ pkgs, ... }:
{
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}