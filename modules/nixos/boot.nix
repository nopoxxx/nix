{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  systemd.defaultUnit = "graphical.target";

  security.sudo.enable = true;
  security.rtkit.enable = true;

  time.timeZone = "Europe/Moscow";

  services.udisks2.enable = true;
  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}