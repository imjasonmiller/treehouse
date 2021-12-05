{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName  = "Jason Miller";
    userEmail = "contact@jasonmiller.nl";
    signing = {
      key = "~/.ssh/github";
      signByDefault = true;
    };
    extraConfig = {
      core = {
        autocrlf = "input";
        safecrlf = true;
        editor = "nvim";
      };
      init = {
        defaultBranch = "main";
      };
      diff = {
        tool = "nvim-diff";
      };
      merge = {
        tool = "nvim-merge";
      };
      protocol = {
        version = 2;
      };
    };
  };
}
