{ config, pkgs, ... }:

{
  imports = [
    ../modules/nixos
    ../modules/packages
  ];

  networking.hostName = "nixos";

  system.stateVersion = "25.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}