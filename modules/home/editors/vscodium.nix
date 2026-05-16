{ config, pkgs, ... }: {
  programs.vscode = {
  enable = true;
  package = pkgs.vscodium;

  profiles.default = {
    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      bbenoist.nix
      jnoortheen.nix-ide
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
    ];

    userSettings = {
    "security.workspace.trust.untrustedFiles" = "open";
    "editor.fontSize" = 18;
    "editor.formatOnSave" = true;
    "files.autoSave" = "afterDelay";
    "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
    "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };
  };
};
}