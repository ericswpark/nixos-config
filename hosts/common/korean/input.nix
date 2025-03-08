{ pkgs, ... }:
{
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          kdePackages.fcitx5-qt
          fcitx5-hangul
        ];
        waylandFrontend = true;
      };
    };
  };
}
