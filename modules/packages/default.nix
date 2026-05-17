{ ... }:
{
  imports = [
    ./fonts.nix
    ./fixes.nix
    ./system.nix
    ./user.nix
  ];

  nixpkgs.config.allowUnfree = true;
}