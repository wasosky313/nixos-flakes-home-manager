{ config, lib, pkgs, ... }:

let
  settings = import ../settings.nix;
in
{
  services = {
    xserver.enable = true;
    displayManager.gdm.enable = true;
    desktopManager = {
      gnome.enable = true;
      cosmic.enable = true;
    };
    openssh.enable = true;
    flatpak.enable = true;
    zerotierone = {
      enable = true;
      joinNetworks = [settings.zerotierNetworkId];
    };
};

  systemd.services = {
    flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
    };
  };
}
