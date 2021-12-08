{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    shellAliases = {
      e = "nvim";
      c = "cargo";
    };
    envExtra = ''
    '';
    initExtra = ''
      eval "$(starship init zsh)"
    '';
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
}
