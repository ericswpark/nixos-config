{ config, pkgs, ... }:

{
  home.username = "ericswpark";
  home.homeDirectory = "/home/ericswpark";

  imports = [
    ./common
    ./plasma-manager
  ];

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
    moonlight-qt
    jellyfin-media-player
    anki-bin
    lmms
    wine
    bottles
    texliveFull
    tor-browser
    jetbrains-toolbox
    signal-desktop
    neovim
    nerdfonts
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
