{ config, pkgs, ... }:  {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font.size = 12;
    font.package = pkgs.nerd-fonts.jetbrains-mono;
    font.name = "JetBrainsMono Nerd Font";
    settings = {
      window_padding_width = 12;
      background_opacity = "0.94";
      background_blur = 32;
      hide_window_decorations = "yes";
      cursor_shape = "block";
      cursor_blink_interval = 1;
      cursor_trail = 3;
  };
  };
}