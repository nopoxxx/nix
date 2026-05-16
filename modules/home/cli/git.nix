{ config, pkgs, ... }:  {
  programs.git = {
    enable = true;
    settings.user.name = "nopoxxx";
    settings.user.email = "dmitriy.nopox@gmail.com";
    settings.core.editor = "codium --wait";
  };
}