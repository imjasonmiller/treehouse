{ config, pkgs, lib, ... }:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      alacritty
      swaylock
      swayidle
      grim
      kanshi
      mako
      slurp
      waybar
      wl-clipboard 
      wofi
      xwayland
    ];
  };

  environment.systemPackages = environment.systemPackages ++ [
    (
      pkgs.writeTextFile {
        name = "startsway";
        destination = "/bin/startsway";
        executable = true;
        text = ''
          #! ${pkgs.bash}/bin/bash

          # first import environment variables from the login manager
          systemctl --user import-environment
          # then start the service
          exec systemctl --user start sway.service
        '';
      }
    )
  ];
}
