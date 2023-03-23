# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# Uncomment for a colored prompt, if the terminal has the capability
force_color_prompt=yes

# Determine if we have color support
if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

# Env
export TODO="$HOME/Documents/Wikis/general/content/general/todo.txt"

# git
# curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
source $HOME/bin/git-completion.bash
# curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source $HOME/bin/git-prompt.sh

export GIT_PROMPT_ONLY_IN_REPO=1
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true

# Default text editors (git and other programs)
export VISUAL=vim
export EDITOR="$VISUAL"

# Set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi

# Set prompt
if [ "$color_prompt" = yes ]; then
  # PS1='[\u@\h \W]\$ '
  # PS1='\[\e[01;36m\]\[\e[01;36m\][\A] \W\[\e[0m\]: '
  # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  # PS1='\[\e[01;36m\]\[\e[01;36m\][\A] \W\[\033[0;35m\]$(__git_ps1 " (%s)")\[\e[0m\]: '
  PS1='${debian_chroot:+($debian_chroot)}🦄 \[\e[01;36m\]\[\e[01;36m\][\A] \W\[\033[0;35m\]$(__git_ps1 " (%s)")\[\e[0m\]: '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
  # PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
# if we want the chroot name in prompt, use:
#   PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Aliases
# Editing and reloading bash profile
alias ebash="vim $HOME/.bashrc"
alias rbash="source $HOME/.bashrc"
# ls
alias lsa="ls -lah"
# Docker
alias dls="docker ps -a"
# Anaconda
alias condals="ls $HOME/miniconda3/envs/"
# Productivity/misc
alias wanipv4="dig @resolver4.opendns.com myip.opendns.com +short -4"
alias weather="curl -4 http://wttr.in/Ipswich"
alias fweather="curl -4s http://wttr.in/Ipswich?format=v2"
alias sweather="curl -4s http://wttr.in/Ipswich?1QF"
alias lweather='curl -4s http://wttr.in/{Ipswich,London,Toronto}?format="%c%20+%l:+%t+%w";echo'
alias moon="curl -4 http://wttr.in/Moon"
alias scal="cal -A 2"
alias ycal="cal -y"
alias todo="cat $TODO"
alias etodo="vim $TODO"
alias stodo='echo -e "Top 5 tasks:\n";head -n 5 $TODO;echo'
alias ttodo='clear;echo -e "Important:\n";grep "(A)" $TODO;echo'
alias day="clear;echo;date;echo;scal;stodo;echo;sweather;echo;moon"
alias sday="clear;echo;date;echo;lweather;echo;scal;stodo;echo;moon"
alias mday="clear;echo;date;echo;lweather;echo;moon"
# Add an "alert" alias for long running commands. Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Load external alias definitions, if any
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Add folder $HOME/bin to PATH, if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi
export PATH

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
