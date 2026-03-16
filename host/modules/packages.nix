{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    git
    google-chrome
    vscode
    brave
    gnupg
    fastfetch
    jdk25
    davinci-resolve
  ];
}
