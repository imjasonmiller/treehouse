{ pkgs, ... }:
{
  programs.fzf = {
    enable = true;
    defaultCommand = "fd --type file --follow --exclude node_modules --exclude .git";
    defaultOptions = [
      "--height 20%"
      "--color=fg:#D1D5DA,bg:#2D333B,hl:#B392F0"
      "--color=fg+:#D1D5DA,bg+:#2D333B,hl+:#B392F0"
      "--color=info:#f7ca88,prompt:#ffcc99,pointer:#79B8FF"
      "--color=marker:#FFAB70,spinner:#9a86fd,header:#DBEDFF"
      "--no-mouse"
      "--inline-info"
      "--preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300'"
      "--preview-window='right:hidden:wrap'"
      "--bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"
    ];
    # ALT_C
    changeDirWidgetCommand = "fd --type directory --follow --exclude node_modules --exclude .git";
    # CTRL_T
    fileWidgetCommand = "fd --type file --follow --exclude node_modules --exclude .git";
  };
}
