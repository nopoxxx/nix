{ config, pkgs, user, ... }: {
  
  programs.zsh.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}