{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    liveRestore = false;
  };

  users.users.wasa.extraGroups = [ "docker" ];
}
