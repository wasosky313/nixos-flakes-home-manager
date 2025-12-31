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

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-gnome3;
    enableSshSupport = true;
  };
}