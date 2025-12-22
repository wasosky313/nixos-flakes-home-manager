{ config, pkgs, ... }:

{
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
