{ config, pkgs, ... }:

{
  services.flatpak = {
    packages = [
      "org.telegram.desktop"
      "com.surfshark.Surfshark"
      "com.bitwarden.desktop"
      "com.usebottles.bottles"
      "app.ytmdesktop.ytmdesktop"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };
}
