{ config, pkgs, ... }: {
  programs.starship = {
  enable = true;

  enableZshIntegration = true;

  settings = builtins.fromTOML (builtins.readFile (
    pkgs.runCommand "starship-config" {} ''
      cp ${pkgs.starship}/share/starship/presets/gruvbox-rainbow.toml $out
    ''
  ));
};
}