{ config, pkgs, ... }: {
  programs.vscodium = {
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
  };
};
}