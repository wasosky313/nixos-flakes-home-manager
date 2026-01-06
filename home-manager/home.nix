{ config, pkgs, ... }:

{
  imports = [
    ./common/direnv
    ./common/flatpak
    ./common/git
    ./common/oh-my-zsh
    ./desktop/gnome
  ];

  home.username = "wasa";
  home.homeDirectory = "/home/wasa";
  home.stateVersion = "26.05";

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
    };
  };

  home.packages = with pkgs; [ 
    lazydocker
    lazygit
    libreoffice
    logseq
    mpv
    nemo
    terminator
    rkvm
    # telegram-desktop # using via flatpak
    qbittorrent
    vlc
    postgresql_17
    element-desktop  # Matrix client with voice/video calls
  ];
}

