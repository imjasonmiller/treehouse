{ pkgs, ... }:
{
  programs.zathura = {
    enable = true;
    options = {
      # General
      font = "Fira Code Nerd Font 11";
      selection-clipboard = "clipboard";
      # GUI
      default-bg = "#282C34";
      default-fg = "#00ff00";
      statusbar-bg = "#282C34";
      statusbar-fg = "#ABB2BF";
      inputbar-bg = "#282C34";
      inputbar-fg = "#ABB2BF";
      recolor = "true";
      recolor-darkcolor = "#ABB2BF";
      recolor-lightcolor = "#282C34";
      statusbar-h-padding = 0;
      statusbar-v-padding = 0;
    };
    extraConfig = ''
      map u scroll half-up
      map d scroll half-down
      map p print
    '';
  };
}
