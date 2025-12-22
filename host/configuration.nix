{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/rkvm-client.nix
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

  services = {
    xserver.enable = true;
    displayManager.gdm.enable = true;
    desktopManager = {
      gnome.enable = true;
      # cosmic.enable = true;
    };
    openssh.enable = true;
    flatpak.enable = true;
    jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };

  systemd.services = {
    flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
        flatpak remote-add --if-not-exists --no-gpg-verify flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
    };
  };

  programs = {
    zsh.enable = true;
    firefox.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    git
    google-chrome
    vscode
    brave
    gnupg
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";

}
