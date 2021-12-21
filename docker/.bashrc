red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
cyan='\[\e[0;36m\]'
CYAN='\[\e[1;36m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
yellow='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
PURPLE='\[\e[1;35m\]'
purple='\[\e[0;35m\]'
# nc is go back to shell original color (no color)
nc='\[\e[0m\]'

# make sure git is installed before calling this
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$UID" = 0 ]; then
    PS1="$RED\u$nc@$RED\H$nc:$CYAN\w$nc\\n$PURPLE#$nc "
else
    PS1="$PURPLE\u$nc@$CYAN\H$nc:$GREEN\w$nc\\n$GREEN\$$nc "
    # PS1="$PURPLE\u$nc@$CYAN\H$nc:$GREEN\w$nc \$(parse_git_branch)$nc\\n$GREEN\$$nc "
fi

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -alh'
alias l='ls $LS_OPTIONS -lA'
