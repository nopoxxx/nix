{ ... }:
{
  imports = [
    ./fonts.nix
    ./fixes.nix
    ./system.nix
    ./user.nix
  ];

  services.flatpak.enable = true;
  nixpkgs.config.allowUnfree = true;
}