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

  # Create Docker network before containers start
  systemd.services.docker-network-my_network = {
    description = "Create Docker network my_network";
    after = [ "docker.service" ];
    requires = [ "docker.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      ${pkgs.docker}/bin/docker network inspect my_network >/dev/null 2>&1 || \
      ${pkgs.docker}/bin/docker network create my_network
    '';
  };
}
