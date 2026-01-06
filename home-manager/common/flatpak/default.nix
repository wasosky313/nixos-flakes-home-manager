{ config, pkgs, ... }:

{
  services.flatpak = {
    packages = [
      "org.telegram.desktop"
      "com.surfshark.Surfshark"
      "com.bitwarden.desktop"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };
}
