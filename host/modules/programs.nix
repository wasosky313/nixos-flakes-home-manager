{ config, lib, pkgs, ... }:

{
  programs = {
    zsh.enable = true;
    firefox.enable = true;
    # kdeconnect.enable = true;
    
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Steam Remote Play
      dedicatedServer.openFirewall = true; # Source Dedicated Server
      gamescopeSession.enable = true; # Gamescope compositor para melhor performance
    };
    
    gamemode.enable = true; # Otimizações de performance para jogos

    # For ssh vscode-server 
    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      openssl
      libuuid
      curl
      icu
   ];
  };
}
