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
      key = "E803AF42430F182D";
      signByDefault = true;
    };
  };
}
