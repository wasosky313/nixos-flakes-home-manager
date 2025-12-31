{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
        user = {
          name = "Soilenyis Mesa";
          email = "soilenyis@gmail.com";
        };
    };
    # signing = {
      # key = "key";
      # signByDefault = true;
    # };
  };
}
