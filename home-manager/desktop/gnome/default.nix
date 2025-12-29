{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    pinentry-gnome3
    gnome-extension-manager
    gnomeExtensions.appindicator
    gnomeExtensions.vitals
    gnomeExtensions.dash-to-dock
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.lock-keys
    gnomeExtensions.gsconnect
  ];

  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [
        (lib.gvariant.mkTuple [ "xkb" "us" ])
        (lib.gvariant.mkTuple [ "xkb" "br" ])
      ];
      # swap ESC and CAPS LOCK keys
      xkb-options = [ "caps:swapescape" ];
    };

    "org/gnome/shell" = {
      favorite-apps = [
        "google-chrome.desktop"
        "code.desktop"
        "brave-browser.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Console.desktop"
      ];
      
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "Vitals@CoreCoding.com"
        "dash-to-dock@micxgx.gmail.com"
        "clipboard-indicator@tudmotu.com"
        "lockkeys@vaina.lt"
        "gsconnect@andyholmes.github.io"
      ];
    };
  };
}
