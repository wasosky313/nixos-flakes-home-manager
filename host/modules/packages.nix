{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    git
    google-chrome
    vscode-fhs
    brave
    gnupg
    fastfetch
  ];
}
