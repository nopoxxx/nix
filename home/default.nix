{ config, pkgs, user, ... }:

{
  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  imports = [
    ../modules/home/browsers
    ../modules/home/cli
    ../modules/home/editors
    ../modules/home/media
    ../modules/home/desktop
  ];
}