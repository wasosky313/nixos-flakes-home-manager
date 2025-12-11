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
  home.stateVersion = "25.11";

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
    # logseq
    mpv
    nemo
    terminator
    rkvm
    telegram-desktop
  ];
}

