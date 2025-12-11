{ config, pkgs, ... }:

{
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

  # TODO send to particular dir
  programs.git = {
    enable = true;
    settings = {
      user = {
	name = "Andy Jimenez Reyes";
	email = "wasosky313@gmail.com";
      };
    };
    signing = {
      key = "1653B52127C182C2";
      signByDefault = true;
    };
  };
}

