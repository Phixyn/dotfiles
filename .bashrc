#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='vim'
PS1='[\u@\h \W]\$ '

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi
export PATH # for good measure

# Starting our X Window Server
# Start X11 server if $DISPLAY env var has not been set and
# we are currently in TTY1 Virtual Terminal
# We can replace -eq 1 with one like -le 3 (for vt1 to vt3)
# if we want to use graphical logins on more than one VT.
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

