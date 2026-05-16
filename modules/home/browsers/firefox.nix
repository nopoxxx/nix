{ config, pkgs, ... }: {
  programs.firefox = {
    enable = true;

    package = pkgs.firefox;

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