{ pkgs, ... }:

{
  home.packages = with pkgs; [ 
    lazydocker
    lazygit
    libreoffice
    mpv
    nemo
    terminator
    telegram-desktop
    vlc
    postgresql_17
  ];
}