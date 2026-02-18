{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # COSMIC extension applets
    cosmic-applets
    cosmic-ext-applet-minimon
    cosmic-ext-applet-caffeine
    
    cosmic-ext-tweaks
    
  ];
}
