# Author: Eric Nova


# Colors ------------------------------------------------------------------ {{{
BLACK="\[\033[0;30m\]"
DARK_GRAY="\[\033[1;30m\]"
LIGHT_GRAY="\[\033[0;37m\]"
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[1;34m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
PURPLE="\[\033[0;35m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
BROWN="\[\033[0;33m\]"
YELLOW="\[\033[1;33m\]"
WHITE="\[\033[1;37m\]"
DEFAULT_COLOR="\[\033[00m\]"
BLACK_BACKGROUND="\[\e[41;1m\]"

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
            export TERM='xterm-256color'
else
            export TERM='xterm-color'
fi

# }}}
# History control --------------------------------------------------------- {{{
# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL="ignoredups:erasedups"
# append to the history file, don't overwrite it
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
export HISTFILESIZE=500000
export HISTSIZE=100000

# multi-line commands as one command
shopt -s cmdhist

# }}}
# Git --------------------------------------------------------------------- {{{
source .git-prompt.sh
    
# }}}
# Prompt ------------------------------------------------------------------ {{{
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
if [ "$color_prompt" = yes ]; then
    #PS1="$DARK_GRAY[\t][\u@\h:$LIGHT_GRAY\w$DARK_GRAY]\$$DEFAULT_COLOR "
    PS1="\n\[$DARK_GRAY┌─[\t]──[\u@\H:$LIGHT_GRAY\w$DARK_GRAY]\n$DARK_GRAY└──$LIGHT_GRAY\$(__git_ps1 '(%s)')$DARK_GRAY\$$DEFAULT_COLOR "
else
    PS1="\n\[$DARK_GRAY┌─[\t]──[\u@\H:$LIGHT_GRAY\w$DARK_GRAY]\n$DARK_GRAY└──$LIGHT_GRAY\$(__git_ps1 '(%s)')$DARK_GRAY\$$DEFAULT_COLOR "
    #PS1="$DARK_GRAY[\t][\u@\h:$LIGHT_GRAY\w$DARK_GRAY]\$$DEFAULT_COLOR "
fi

unset color_prompt force_color_prompt

# }}}
# Aliases ----------------------------------------------------------------- {{{
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias python='python3.2'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
#alias vim='vim -X'
alias vkill='kill $(ps aux|grep firefox|grep opt|grep -Eow [0-9]{5})'
alias r='ranger'
alias vlc='vlc --control dbus'
alias v='vim --remote-silent'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# }}}
# Exports ----------------------------------------------------------------- {{{
export PATH=$PATH:/home/rayenok/.eclipse/:/home/rayenok/software/:/home/rayenok/.sdk/tools/:/home/rayenok/.eclipse:/media/Zero/aplicaciones/linux/Shotcut/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/lib/i386-linux-gnu/
export JAVA_HOME=/usr/lib/jvm/default-java
export EDITOR=/usr/bin/vim 
export JAVA_HOME=/usr/lib/jvm/java-7-oracle
export JDK_HOME=/usr/lib/jvm/java-7-oracle
export STUDIO_JDK=/usr/lib/jvm/java-7-oracle
export MYVIMRC=/home/rayenok/.vimrc

# }}}
