{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # COSMIC applets
    cosmic-applets          # Collection of COSMIC applets
    cosmic-files           # File manager
    cosmic-edit            # Text editor
    cosmic-term            # Terminal
    cosmic-settings        # Settings app
    
    # System monitoring - similar to Vitals
    # Note: COSMIC has built-in system monitoring in cosmic-applets
    # You can also install additional monitoring tools
    btop                   # Resource monitor (works in terminal)
    mission-center         # GTK4 system monitor (works great with COSMIC)
  ];

  # GTK configuration for better integration
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
}
