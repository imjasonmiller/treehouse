{ config, pkgs, lib, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      transmission
    ];

    services.transmission = {
      enable = true;
      settings = {
        "download-dir" = "/home/jason/Downloads";
        "incomplete-dir-enabled" = false;
      };
    };
  };
}
