{ config, pkgs, ... }:

{

  imports = [
    ../../home-manager/common
    ../../home-manager/common/xclip.nix
    ../../home-manager/plasma-manager
  ];

  programs.home-manager.enable = true;

  home = {
    username = "ericswpark";
    homeDirectory = "/home/ericswpark";

    packages = with pkgs; [
      neofetch
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
      nixfmt-rfc-style
      nil
      xclip
    ];

    sessionVariables.EDITOR = "nvim";

    # Use my dotfiles repository
    # git clone git@github.com:ericswpark/dot_files.git ~/.dotfiles
    file = {
      ".config/mpv" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/mpv/.config/mpv";
      };

      ".vimrc" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/vim/.vimrc";
      };
    };

    stateVersion = "24.05";
  };

  programs.bash = {
    enable = true;

    initExtra = ''
      # include .profile if it exists
      [[ -f ~/.profile ]] && . ~/.profile
    '';
  };
}
