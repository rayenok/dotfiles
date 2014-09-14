
# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias python='python3.2'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -lisa'
alias v='vim --remote-silent'
alias vkill='kill $(ps aux|grep firefox|grep opt|grep -Eow [0-9]{5})'
alias r='ranger'
alias vlc='vlc --control dbus'

alias terminal_scratchpad='urxdtcd -name "scratchpad" -e bash -c "tmux attach -t scratchpad || tmux new-session -s scratchpad"&'
alias emacs_scratchpad='emacs -name "Emacs_scratchpad" -g 133x55+480+135 --no-splash --funcall "org-agenda-list"&'
alias emacs_main=exec --no-startup-id i3-msg 'workspace 1: emacs; exec (emacs -name "Emacs_main")&'
