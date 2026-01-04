{ config, pkgs, ... }:

{
  services.flatpak = {
    packages = [
      "org.telegram.desktop"
      "com.surfshark.Surfshark"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };
}
