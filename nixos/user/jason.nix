{ config, lib, pkgs, ... }:
{
  users = {
    users.jason = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "transmission" "docker" ];
    };
    defaultUserShell = pkgs.zsh;
  };
}
