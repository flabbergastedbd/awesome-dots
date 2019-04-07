#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
export PS1="\[\e[00;36m\]\u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[00;33m\]\h\[\e[0m\]\[\e[00;37m\]:[\[\e[0m\]\[\e[00;32m\]\w\[\e[0m\]\[\e[00;37m\]]\n\$> \[\e[0m\]"
# PS1="\[\e[01;31m\]??[\t]??[\[\e[01;31m\u\e[01;31m\]]??[\[\e[00;31m\]${HOSTNAME%%.*}\[\e[01;31m\]]:\w$\[\e[01;31m\]\n\[\e[01;37m\]???\[\e[01;37m\](\[\e[32;1m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/usr/bin/ls -lah | /usr/bin/grep -m 1 total | /usr/bin/sed 's/total //')b\[\e[01;37m\])>>\[\e[0m\]"

export LANG="en_US.UTF-8"
