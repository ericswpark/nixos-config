{ config, pkgs, ... }:

{
  home.username = "ericswpark";
  home.homeDirectory = "/home/ericswpark";

  imports = [
    ../../home-manager/common
    ../../home-manager/plasma-manager
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
    wine
    bottles
    tor-browser
    signal-desktop
    neovim
    unzip
    python3
    kdePackages.kdenlive
    arduino-ide
    screen
    minicom
    prusa-slicer
    android-tools
    trayscale
    google-chrome
    kdePackages.partitionmanager
    gparted
    freecad
    gnumake
    gcc
    rustup
    jetbrains.rust-rover
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    android-studio
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  home.sessionVariables.EDITOR = "nvim";

  programs.bash = {
    enable = true;

    initExtra = ''
      # include .profile if it exists
      [[ -f ~/.profile ]] && . ~/.profile
    '';
  };

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
