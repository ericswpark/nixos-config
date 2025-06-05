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
      zsh-powerlevel10k
      pay-respects
      meslo-lgs-nf
      davinci-resolve-studio
      krita
      bs-manager
      obs-studio
      wlx-overlay-s
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

    stateVersion = "25.05";
  };

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
    initContent = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      
      # Source P10K config if it exists
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      # Function for "incognito" mode
      function incognito() {
          unset HISTFILE
          echo "Done! This terminal session will not be recorded into history."
      }

      eval "$(pay-respects zsh --alias)"
    '';
  };
}
