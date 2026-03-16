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

  # Use the latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # Driver melhorado para controles Xbox via Bluetooth
  # boot.extraModulePackages = with config.boot.kernelPackages; [ xpadneo ];

  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      ensureProfiles = {
        profiles = {
          Pelus = {
            connection = {
              id = "Pelus";
              type = "wifi";
              autoconnect = true;
              autoconnect-priority = 999;
            };
            wifi = {
              ssid = "Pelus";
              mode = "infrastructure";
            };
            wifi-security = {
              key-mgmt = "wpa-psk";
              psk = "Pelu2702Pelu2702";
            };
            ipv4 = {
              method = "auto";
            };
            ipv6 = {
              method = "auto";
            };
          };
        };
      };
    };
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

  # Suporte para jogos com Proton
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Necessário para jogos Windows via Proton
    extraPackages = with pkgs; [
    intel-media-driver # Essencial para o Jellyfin
    vpl-gpu-rt         # Suporte para processamento de vídeo novo (OneVPL)
    intel-compute-runtime # Para acelerar coisas com IA/OpenCL
  ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Força o driver VA-API da Intel (Arc/iGPU) para aceleração de vídeo no navegador
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  system.stateVersion = "25.11";

}
