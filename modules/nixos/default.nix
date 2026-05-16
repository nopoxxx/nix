{ ... }:

{
  imports = [
    ./audio.nix
    ./boot.nix
    ./cleanup.nix
    ./graphics.nix
    ./locale.nix
    ./networking.nix
    ./steam.nix
    ./users.nix
    ./xdg-portals.nix
    ./niri.nix
    ./qs-shell.nix
    ../../hardware-configuration.nix
  ];
}