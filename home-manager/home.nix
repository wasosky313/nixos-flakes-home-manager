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
    pinentry-gnome3 # TODO put in gnome config
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
      key = "B99BD7CB52F8B2BB";
      signByDefault = true;
    };
  };
}

