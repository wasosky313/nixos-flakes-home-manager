{ config, pkgs, ... }:

{
  imports = [
    ../../common
    ../../desktop/gnome
    ../../common/direnv
    ../../common/oh-my-zsh
    ./git
  ];

  home.username = "wasa";
  home.homeDirectory = "/home/wasa";
  home.stateVersion = "25.11";

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      # Aliases específicos para wasa
    };
  };

  # Pacotes específicos para wasa
  home.packages = with pkgs; [ 
    # Adicione pacotes específicos que wasa precisa
  ];
}