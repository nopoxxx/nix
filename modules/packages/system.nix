{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    vim
    fzf
    ripgrep
    bat
    eza
    quickshell
    unzip
    zip
    nautilus
    home-manager
    steam
    xwayland-satellite
    nvtopPackages.full
    fastfetch
    btop
    gamemode
    tree
    age
    niri
  ];
}
