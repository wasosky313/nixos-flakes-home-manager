{ config, pkgs, ... }:

{
  services.flatpak = {
    packages = [
      "org.telegram.desktop"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };
}
