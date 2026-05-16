{ config, pkgs, ... }:  {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "~/nix";
      in {
      rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}";

      conf = "codium ${flakeDir}/";
      pkgs = "nano ${flakeDir}/nixos/modules/packages.nix";

      ls = "ls --color";
      code = "codium";
      c = "clear";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}