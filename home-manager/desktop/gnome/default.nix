{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    pinentry-gnome3
    gnome-extension-manager
  ];

  dconf.settings = {
    # swap ESC and CAPS LOCK keys
    "org/gnome/desktop/input-sources" = {
      sources = [
        (lib.gvariant.mkTuple [ "xkb" "us+intl" ])
      ];
      xkb-options = [ "caps:swapescape" ];
    };
  };
}
