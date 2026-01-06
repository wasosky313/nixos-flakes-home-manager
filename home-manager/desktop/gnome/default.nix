{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    pinentry-gnome3
    gnome-extension-manager
    gnome-tweaks
    gnome-themes-extra
    gnomeExtensions.appindicator
    gnomeExtensions.vitals
    gnomeExtensions.dash-to-dock
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.lock-keys
    gnomeExtensions.gsconnect
  ];

  # Config GTK for legacy applications like Nemo
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [
        (lib.gvariant.mkTuple [ "xkb" "us" ])
        (lib.gvariant.mkTuple [ "xkb" "br" ])
      ];
      # swap ESC and CAPS LOCK keys
      xkb-options = [ "caps:swapescape" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

    "org/gnome/shell" = {
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "google-chrome.desktop"
        "code.desktop"
        "brave-browser.desktop"
        "terminator.desktop"
        "org.gnome.Console.desktop"
        "Logseq.desktop"
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
