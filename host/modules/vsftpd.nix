{ config, lib, pkgs, ... }:

{
  networking.firewall = {
    allowedTCPPorts = [ 21 ]; # FTP
    allowedTCPPortRanges = [
      { from = 50000; to = 50100; } # FTP passive mode
    ];
  };

  services.vsftpd = {
    enable = true;
    writeEnable = true;
    localUsers = true;
    userlist = [ "wasa" ]; # Usuários permitidos
    userlistEnable = true;
    anonymousUser = false;
    anonymousUploadEnable = false;
    anonymousMkdirEnable = false;
    chrootlocalUser = true;
    allowWriteableChroot = true;
    localRoot = "/home/media";
    extraConfig = ''
      pasv_min_port=50000
      pasv_max_port=50100
      pasv_enable=YES
      pasv_promiscuous=YES
    '';
  };
}
