{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.dimensions = {
        lines = 96;
        columns = 0;
      };
      font = {
        normal = {
          family = "Jetbrains Mono";
          style = "normal";
        };
        bold = {
          family = "Jetbrains Mono";
          style = "Bold";
        };
        italic = {
          family = "Jetbrains Mono";
          style = "Italic";
        };
        size = 11;
      };
      colors = {
        primary = {
          background = "#24292e";
          foreground = "#d1d5da";
        };
        normal = {
          black = "#24292e"; 
          red = "#ff8787";
          green = "#85e89d";
          yellow = "#ffcd70";
          blue = "#79b8ff";
          magenta = "#b392f0";
          cyan = "#70ffce";
          white = "#edeeef";
        };
        bright = { 
          black = "#24292e"; 
          red = "#ff8787";
          green = "#85e89d";
          yellow = "#ffc55b";
          blue = "#79b8ff";
          magenta = "#b392f0";
          cyan = "#70ffce";
          white = "#fafbfc";
        };
        cursor = {
          text = "#fffefe";
          cursor = "#c7c7c7";
        };
      };
    };
  };
}
