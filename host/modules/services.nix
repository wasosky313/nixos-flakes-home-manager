{ config, lib, pkgs, ... }:

{
  services = {
    xserver.enable = true;
    displayManager.gdm.enable = true;
    desktopManager = {
      gnome.enable = true;
      # cosmic.enable = true;
    };
    openssh.enable = true;
    flatpak.enable = true;
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
}
