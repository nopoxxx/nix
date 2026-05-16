{ config, ... }: {
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.daed = {
    enable = true;
    
    openFirewall = {
      enable = true;
      port = 12345;
    };

    listen = "0.0.0.0:2023";
  };
}