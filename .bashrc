# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

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

# git
# wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
source $HOME/bin/git-completion.bash
# wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source $HOME/bin/git-prompt.sh

export GIT_PROMPT_ONLY_IN_REPO=1
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true

# Set prompt
if [ "$color_prompt" = yes ]; then
  # PS1='[\u@\h \W]\$ '
  # PS1='\[\e[01;36m\]\[\e[01;36m\][\A] \W\[\e[0m\]: '
  PS1='\[\e[01;36m\]\[\e[01;36m\][\A] \W\[\033[0;35m\]$(__git_ps1 " (%s)")\[\e[0m\]: '
else
  PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
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

# Editing and reloading bash profile
alias ebash="vim $HOME/.bashrc"
alias rbash="source $HOME/.bashrc"
alias lsa="ls -lah"
# Productivity/misc
alias weather="curl -4 http://wttr.in/Ipswich"
alias moon="curl -4 http://wttr.in/Moon"

# Load external alias definitions, if any
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi
export PATH

# Start the X Window Server
# Start X11 server if $DISPLAY env var has not been set and
# we are currently in TTY1 Virtual Terminal.
# We can replace -eq 1 with one like -le 3 (for vt1 to vt3)
# if we want to use graphical logins on more than one VT.
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
