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
    unzip
    python3
    kdePackages.kdenlive
    davinci-resolve
    arduino-ide
    screen
    minicom
    prusa-slicer
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;


  # Use my dotfiles repository
  # git clone git@github.com:ericswpark/dot_files.git ~/.dotfiles
  home.file = {
    ".config/mpv" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/mpv/.config/mpv";
    };

    ".vimrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/vim/.vimrc";
    };
  };
}
