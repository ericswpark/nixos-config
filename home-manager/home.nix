{ config, pkgs, ... }:

{
  home.username = "ericswpark";
  home.homeDirectory = "/home/ericswpark";

  home.packages = with pkgs; [
    neofetch
    hugo
    discord
    vscode
    obsidian
    bitwarden
    slack
    telegram-desktop
    thunderbird-bin
    mosh
    mpv
    yt-dlp
    btop
    rclone
    gnupg
    pinentry-tty
    element-desktop
    kuro
  ];

  programs.git = {
    enable = true;
    userName = "Eric Park";
    userEmail = "me@ericswpark.com";
    extraConfig = {
      commit.gpgsign = true;
      user.signingKey = "D5DCDB0D";
    };
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
