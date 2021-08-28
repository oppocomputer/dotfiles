#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -a --color=auto'
alias nano="micro"
alias xenv='xev | awk -F"[ )]+"" ""/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }"'

#PS1='[\u@\h \W]\$ '
PS1='[\u \W]\$ '

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
