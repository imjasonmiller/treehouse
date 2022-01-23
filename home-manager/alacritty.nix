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
          background = "0x2d333b";
          foreground = "0xadbac7";
        };
        normal = {
          black = "0x2d333b"; 
          red = "0xf47067";
          green = "0x8ddb8c";
          yellow = "0xf69d50";
          blue = "0x6cb6ff";
          magenta = "0xdcbdfb";
          cyan = "0x96d0ff";
          white = "0xadbac7";
        };
        bright = { 
          black = "0x768390"; 
          red = "0xf47067";
          green = "0x8ddb8c";
          yellow = "0xf69d50";
          blue = "0x6cb6ff";
          magenta = "0xdcbdfb";
          cyan = "0x96d0ff";
          white = "0xadbac7";
        };
        cursor = {
          text = "#fffefe";
          cursor = "#c7c7c7";
        };
      };
    };
  };
}
