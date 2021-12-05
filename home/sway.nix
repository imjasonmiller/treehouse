{ pkgs, ... }:
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
}
