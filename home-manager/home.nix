{ config, pkgs, ... }:

{
  imports = [
    ./common/direnv
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

  services.flatpak = {
    packages = [
      "org.telegram.desktop"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
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
  ];
}

