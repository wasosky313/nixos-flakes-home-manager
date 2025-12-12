{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/rkvm-client.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

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

  services.xserver.enable = true;

  services.desktopManager.gnome.enable = true;

  services.displayManager.gdm.enable = true;

  services.openssh = {
    enable = true;
  };

  programs.zsh.enable = true;
  programs.firefox.enable = true;
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
  
  # Flatpak
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists --no-gpg-verify flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";

}
