{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    liveRestore = false;
  };

  users.users.wasa.extraGroups = [ "docker" ];

  # Declarative containers
  virtualisation.oci-containers = {
    backend = "docker";
    containers = import ./containers.nix;
  };
}
