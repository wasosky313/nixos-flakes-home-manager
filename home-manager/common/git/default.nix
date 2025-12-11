{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Andy Jimenez Reyes";
    userEmail = "wasosky313@gmail.com";
    signing = {
      key = "B99BD7CB52F8B2BB";
      signByDefault = true;
    };
  };
}
