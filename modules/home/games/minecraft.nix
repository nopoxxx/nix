{ pkgs, ... }: {
  programs.prismlauncher = {
    enable = true;

    extraPackages = [
      (pkgs.runCommand "prismlauncher-gruvbox-soft" {} ''
        mkdir -p $out/share/PrismLauncher/themes
        cp -r ${pkgs.fetchFromGitHub {
          owner = "PrismLauncher";
          repo = "Themes";
          rev = "main";
          sha256 = "sha256-aaphBE1QkJid9IAUZZB3zcabqSAd/GoMsl9seulv8Tw=";
        }}/themes/Gruvbox-Soft \
          $out/share/PrismLauncher/themes/
      '')
    ];
  };
}