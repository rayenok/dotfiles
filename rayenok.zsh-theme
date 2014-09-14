# ZSH Theme - Preview: http://dl.dropbox.com/u/4109351/pics/gnzh-zsh-theme.png
# Based on bira theme
# load some modules
autoload -U colors zsh/terminfo # Used in the colour alias below
colors
setopt prompt_subst

# make some aliases for the colours: (could use normal escape sequences too)
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$fg[${(L)color}]%}'
done
eval PR_NO_COLOR="%{$terminfo[sgr0]%}"
eval PR_BOLD="%{$terminfo[bold]%}"

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  eval PR_USER='%{$fg_bold[black]%}%n${PR_NO_COLOR}'
  eval PR_USER_OP='${PR_BLUE}%#${PR_NO_COLOR}'
  local PR_PROMPT='$PR_NO_COLOR➤ $PR_NO_COLOR'
else # root
  eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
  eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
  local PR_PROMPT='$PR_RED➤ $PR_NO_COLOR'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  eval PR_HOST='%{$fg_bold[black]%}%M${PR_NO_COLOR}' #SSH
else
  eval PR_HOST='${PR_GREEN}%M${PR_NO_COLOR}' # no SSH
fi

local return_code="%(?..%{$PR_RED%}%? ↵%{$PR_NO_COLOR%})"

local user_host='${PR_USER}${PR_CYAN}@${PR_HOST}'
local current_dir='%{$PR_BOLD$PR_WHITE%}%~%{$PR_NO_COLOR%}'
local git_branch='$(git_prompt_info)'

PROMPT="%{$fg_bold[black]%}┌─[%T]──[%n@%m:${current_dir}%{$fg_bold[black]%}]
└──${git_branch}\$${PR_NO_COLOR} "

# PROMPT="\n\[$DARK_GRAY┌─[%T]──[%n@%m:$LIGHT_GRAY\w$DARK_GRAY]\n$DARK_GRAY└──$LIGHT_GRAY')')$DARK_GRAY\$$DEFAULT_COLOR ""]" 
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$PR_BOLD$PR_WHITE%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$fg_bold[black]%}"
