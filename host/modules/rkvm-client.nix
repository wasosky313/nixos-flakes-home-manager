{ config, lib, pkgs, ... }:

{
  systemd.services.rkvm-client = {
    description = "RKVM Client Service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.rkvm}/bin/rkvm-client /etc/rkvm/client.toml";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
}
