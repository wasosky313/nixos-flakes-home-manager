{ config, pkgs, ... }:

{
  services.flatpak = {
    packages = [
      "org.telegram.desktop"
      "com.surfshark.Surfshark"
      "com.bitwarden.desktop"
      "com.usebottles.bottles"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };
}
