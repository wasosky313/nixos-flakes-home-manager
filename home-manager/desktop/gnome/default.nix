{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pinentry-gnome3
  ];
}
