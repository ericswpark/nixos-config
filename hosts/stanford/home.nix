{ config, pkgs, ... }:

{
  home.username = "ericswpark";
  home.homeDirectory = "/home/ericswpark";

  home.packages = with pkgs; [
    # TODO: just for testing, please remove
    neofetch
    hugo
  ];

  programs.git = {
    enable = true;
    userName = "Eric Park";
    userEmail = "me@ericswpark.com";
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
