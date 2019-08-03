# For use with MacOS

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export ANDROID_HOME="$HOME/Library/Android/sdk/"
export TODO="$HOME/Documents/Journal/todo.txt"

# git
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
source $HOME/bin/git-completion.bash
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source $HOME/bin/git-prompt.sh

export GIT_PROMPT_ONLY_IN_REPO=1
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true

export PS1='🦄 \[\e[0;36m\]\[\e[0;36m\][\A] \W\[\033[0;35m\]$(__git_ps1 " (%s)")\[\e[0m\]: '

# iTerm2 session title
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'
fi

# Editing and reloading bash profile
alias ebash="vim $HOME/.bash_profile"
alias rbash="source $HOME/.bash_profile"
# Colors for `ls` and `grep` command
alias ls="ls -G"
alias lsa="ls -lahG"
alias grep="grep --colour=AUTO"
# Python3 virtualenv
alias virtualenv3="$HOME/Library/Python/3.7/bin/virtualenv"
# Productivity/misc
alias weather="curl -4 http://wttr.in/Ipswich"
alias moon="curl -4 http://wttr.in/Moon"
alias todo="cat $TODO"
alias etodo="vim $TODO"
alias ttodo='clear;echo -e "Important:\n";grep "(A)" $TODO;echo'
alias morning="osascript $HOME/bin/morning.applescript"
