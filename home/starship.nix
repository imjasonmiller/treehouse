{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      character = {
        success_symbol = "[╰─](dimmed) [](bold cyan)";
        error_symbol = "[╰─](dimmed) [](bold red)";
      }; 
      git_branch = {
        symbol = " ";  
      };
      package = {
        symbol = " ";
        style = "bold 3";
      };
      rust = {
        symbol = " ";
      };
      directory = {
        format = "[╭─](dimmed) [$path]($style)[$read_only]($read_only_style) ";
      };
    };
  };
}
