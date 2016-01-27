#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi='vim'
PS1='[\u@\h \W]\$ '

export VISUAL='vim'

# Display the MOTD at a new Bash session
cat /etc/motd

# Starting our X Window Server
# Start X11 server if $DISPLAY env var has not been set and
# we are currently in TTY1 Virtual Terminal
# We can replace -eq 1 with one like -le 3 (for vt1 to vt3)
# if we want to use graphical logins on more than one VT.
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

