{ config, pkgs, ... }:

{
  imports = [
    ./common/git
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
    pinentry-gnome3 # TODO put in gnome config
  ];
}

