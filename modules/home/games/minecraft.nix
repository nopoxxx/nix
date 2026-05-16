{ config, pkgs, ... }:  {
programs.prismlauncher = {
  enable = true;

  extraPackages = [
    (pkgs.stdenvNoCC.mkDerivation {
      pname = "prismlauncher-gruvbox-soft";
      version = "1.0";

      src = pkgs.fetchFromGitHub {
        owner = "PrismLauncher";
        repo = "Themes";
        rev = "main";
        sha256 = "sha256-aaphBE1QkJid9IAUZZB3zcabqSAd/GoMsl9seulv8Tw=";
      };

      installPhase = ''
        mkdir -p $out/share/PrismLauncher/themes
        cp -r themes/Gruvbox-Soft \
          $out/share/PrismLauncher/themes/
      '';
    })
  ];
};
}