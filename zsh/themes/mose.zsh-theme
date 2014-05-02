local usercolor='yellow'
local othercolor='cyan'
if [ $UID -eq 0 ]; then
  usercolor='red'
fi
PROMPT="%{$fg[$othercolor]%}%T %{$fg[$usercolor]%}%m%{$reset_color%}:%{$fg[green]%}%c%{$reset_color%} "
RPROMPT='%{$fg[blue]%}$(git_prompt_info)%{$reset_color%}% '

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"

#  vim: set ft=zsh ts=2 sw=2 et:
