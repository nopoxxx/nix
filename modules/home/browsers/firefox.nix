{ config, pkgs, ... }: {
  programs.firefox = {
    enable = true;

    package = pkgs.firefox;

    configPath = "${config.xdg.configHome}/mozilla/firefox";

    profiles.default = {
      id = 0;
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        betterttv
        ublock-origin
        sponsorblock
      ];

    };
  };
}