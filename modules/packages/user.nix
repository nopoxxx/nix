{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gnome-disk-utility
    pavucontrol
    equibop
    lutris
    protonplus
    easyeffects
    ayugram-desktop
    qbittorrent
    deadlock-mod-manager
    flatpak
    qpwgraph
  ];
}
