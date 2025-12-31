{ config, pkgs, ... }:

{
  imports = [
    ../../common
    ../../common/direnv
    ../../common/oh-my-zsh
    ../../desktop/gnome
    ./git
  ];

  home.username = "pelu";
  home.homeDirectory = "/home/pelu";
  home.stateVersion = "25.11";

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
    };
  };

  # Pacotes específicos para wasa
  home.packages = with pkgs; [ 
  # Adicione pacotes específicos que wasa precisa
  ];
}