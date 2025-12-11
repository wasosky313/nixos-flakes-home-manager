{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pinentry-gnome3
  ];

  dconf.settings = {
    # swap ESC and CAPS LOCK keys
    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "caps:swapescape" ];
    };
  };
}
