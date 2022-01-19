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
          family = "JetBrainsMono";
          style = "normal";
        };
        bold = {
          family = "JetBrainsMono";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono";
          style = "Italic";
        };
        size = 11;
      };
      colors = {
        primary = {
          background = "0x24292e";
          foreground = "0xd1d5da";
        };
        normal = {
          black = "0x586069"; 
          red = "0xea4a5a";
          green = "0x34d058";
          yellow = "0xffea7f";
          blue = "0x2188ff";
          magenta = "0xb392f0";
          cyan = "0x39c5cf";
          white = "0xd1d5da";
        };
        bright = { 
          black = "0x959da5"; 
          red = "0xf97583";
          green = "0x85e89d";
          yellow = "0xffea7f";
          blue = "0x79b8ff";
          magenta = "0xb392f0";
          cyan = "0x56d4dd";
          white = "0xfafbfc";
        };
        cursor = {
          text = "#fffefe";
          cursor = "#c7c7c7";
        };
      };
    };
  };
}
