#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Bin
export PATH=$PATH:~/bin

# Alias
alias cdwww="cd /srv/http"
alias i3lock="i3lock -i ~/Pictures/sky.png"

# Proxy
export http_proxy=http://192.168.4.1:800
export https_proxy=http://192.168.4.1:800

