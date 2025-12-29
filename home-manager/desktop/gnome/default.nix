{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    pinentry-gnome3
    gnome-extension-manager
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
        "com.google.Chrome.desktop"
        "code.desktop"
        "brave-browser.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Console.desktop"
      ];
    };
  };
}
