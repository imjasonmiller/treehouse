{ pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
    ];
    fontconfig = {
      enable = true;
      antialias = true;
      hinting.enable = true;
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        emoji = [ "Noto Emoji" "Noto Music" ];
        monospace = [ "JetBrainsMono" "Fira Code Nerd Font" "Noto Sans Mono" ];
      };
    };
  };
}
