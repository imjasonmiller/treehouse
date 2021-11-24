{ lib, pkgs, ... }:

{
  users.users.jason = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };
}