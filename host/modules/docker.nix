{ config, pkgs, ... }:

{
  # Enable Docker
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  # Add user to docker group
  users.users.wasa.extraGroups = [ "docker" ];
}
