{ ... }:
{
  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    configFile = {
      # Disable recents
      "kactivitymanagerdrc"."Plugins"."org.kde.ActivityManager.ResourceScoringEnabled" = false;

      ###################
      # Dolphin options #
      ###################

      # Disable remembering previous state
      "dolphinrc"."General"."RememberOpenedTabs" = false;

      # Show preview for files on remote (up to 5 MiB)
      "kdeglobals"."PreviewSettings"."EnableRemoteFolderThumbnail" = false;
      "kdeglobals"."PreviewSettings"."MaximumRemoteSize" = 5242880;

      ################
      # KATE options #
      ################

      # Disable recent files
      "katerc"."General"."Recent File List Entry Count" = 0;

    };
  };
}
