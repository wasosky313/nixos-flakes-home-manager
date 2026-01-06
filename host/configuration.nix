{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/services.nix
      ./modules/packages.nix
      ./modules/programs.nix
      ./modules/rkvm-client.nix
      ./modules/vsftpd.nix
      ./modules/docker
    ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 
        22    # SSH
        8080  # Redpanda Console
        8081  # Redpanda Schema Registry
        8082  # Redpanda Pandaproxy
        8096  # Jellyfin HTTP
        8090  # web qbittorent remote
        9092  # Redpanda Kafka (external)
        9644  # Redpanda Admin API
        28082 # Redpanda Pandaproxy (internal)
        29092 # Redpanda Kafka (internal)
      ];
      allowedTCPPortRanges = [
        { from = 1714; to = 1764; } # GNOME Connect
      ];
      allowedUDPPorts = [
        1900  # Jellyfin service discovery
        7359  # Jellyfin client discovery
      ];
      allowedUDPPortRanges = [
        { from = 1714; to = 1764; } # GNOME Connect
      ];
    };
  };

  time.timeZone = "America/Sao_Paulo";

  users.users.wasa = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";

}
