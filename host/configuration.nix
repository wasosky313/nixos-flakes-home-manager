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
      allowedTCPPorts = [ 22 ]; # SSH
      allowedTCPPortRanges = [
        { from = 1714; to = 1764; } # GNOME Connect
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
