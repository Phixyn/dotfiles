# For use on MacOS

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="$PATH:$HOME/bin:$HOME/Library/Android/sdk/platform-tools:$HOME/.gem/ruby/2.3.0/bin:$HOME/bin/apache-maven-3.6.3/bin"
export ANDROID_HOME="$HOME/Library/Android/sdk/"
export TODO="$HOME/Documents/Journal/todo.txt"

# git
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
source $HOME/bin/git-completion.bash
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
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
# Docker
alias dls="docker ps -a"
# Anaconda
alias condals="ls $HOME/opt/anaconda3/envs/"
# Productivity/misc
alias weather="curl -4s http://wttr.in/Ipswich?F"
alias fweather="curl -4s http://wttr.in/Ipswich?format=v2"
alias sweather="curl -4s http://wttr.in/Ipswich?1QF"
alias lweather='curl -4s http://wttr.in/{Ipswich,London,Toronto}?format="%c%20+%l:+%t+%w"'
alias moon="curl -4s http://wttr.in/Moon?F"
alias scal="cal -A 2"
alias ycal="cal -y"
alias todo="cat $TODO"
alias etodo="vim $TODO"
alias stodo='echo -e "Top 5 tasks:\n";head -n 5 $TODO;echo'
alias ttodo='clear;echo -e "Important:\n";grep "(A)" $TODO;echo'
alias morning="osascript $HOME/bin/morning.applescript"
alias day="clear;echo;date;echo;scal;stodo;echo;sweather;echo;moon"
alias sday="clear;echo;date;echo;lweather;echo;scal;stodo;echo;moon"
alias mday="clear;echo;date;echo;lweather;echo;moon"

# iTerm Shell Integration (https://iterm2.com/documentation-shell-integration.html)
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# iTerm user vars (https://www.iterm2.com/documentation-scripting-fundamentals.html)
function iterm2_print_user_vars() {
  iterm2_set_user_var weatherCondition $(curl -4s -m 0.1 http://wttr.in/Ipswich?format="%c")
  iterm2_set_user_var weatherLocation $(curl -4s -m 0.1 http://wttr.in/Ipswich?format="%l")
  iterm2_set_user_var weatherTemp $(curl -4s -m 0.1 http://wttr.in/Ipswich?format="%t")
  iterm2_set_user_var weatherWind $(curl -4s -m 0.1 http://wttr.in/Ipswich?format="%w")
}
