# Duplicate history avoidance
HISTCONTROL=ignoreboth # ignorespaces and ignoredups

# Command sharing between terminals
export SHARE_HIS="history -a; history -c; history -r; $SHARE_HIS"

# Turn off .bash_history appending mode
shopt -u histappend

# History Size
HISTSIZE=2000
HISTFILESIZE=4000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable color prompt mode
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		color_prompt=yes
	else
		color_prompt=yes
	fi
fi

# Prompt settings
if [ "$color_prompt" = yes ]; then
	PS1='\[\e[1;36m\]\d\[\e[1;33m\] \t \[\e[1;35m\]\n\u@\h\[\e[0;37m\]:\w\[\e[0;31m\]\$\[\e[0;32m\] '
else
	PS1='\d \t \n\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt
# If the number of directories exceeds the set value, "\w" will be omitted.
export PROMPT_DIRTRIM=5

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ----------------- My sets -----------------

# Set permissions for newly created files to always be 644
umask 022

# less
alias less='less -g -i -M -R -S -W -F -X --shift 4'
# Always use less when looking at man
export PAGER=less
# Display the file name and number of lines in the status line of less, and what percentage is now
export LESS='-g -i -M -R -S -W -F -X --shift 4'
# Display Japanese with less
export JLESSCHARSET=japanese-ujis

# vimode
set -o vi
bind '"jj": vi-movement-mode'

# Lang
LC_ALL=C

# ----------- My alias sets -----------

# Editor
alias ed='vim'
alias edit='vim'
alias vi='vim'
alias emacs='emacs -nw'
alias nano='nano -k -w -i -S'
VIMRUNTIME=`vim -e -T dumb --cmd 'exe "set t_cm=\<C-M>"|echo $VIMRUNTIME|quit' | tr -d '\015' `
alias vless='${VIMRUNTIME}/macros/less.sh'
# Apt
alias au='sudo apt update -y'
alias ag='sudo apt upgrade -y'
alias ar='sudo apt autoremove --purge -y'
alias ac='sudo apt clean'
alias ai='sudo apt install -y'
alias auu='sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove --purge -y && sudo apt clean'
# Git
alias gi='git init'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gcl='git clone'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gps='git push'
alias gpl='git pull'
alias gl='git log'
alias gr='git reset'
alias grh='git reset --hard'
alias gra='git remote add origin'
# File
alias bashrc='source ~/.bashrc'
alias bashpf='source ~/.bash_profile'
# Docker
alias dockers='sudo service docker start'
alias dockersu='sudo service docker status'
alias dockersp='sudo service docker stop'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias ds='docker stop'
alias drm='docker rm'
alias drmi='docker rmi'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcb='docker-compose build'
alias di='docker images'
alias dils='docker image ls'
# Network
alias eth0='ifconfig eth0'
alias wlp='ifconfig wlp2s0'
alias wifi='nmtui'
alias wifils='nmcli device wifi list'
alias wifis='nmcli device status'
# Short
alias ll='ls -l'
alias la="ls -a"
alias c='clear'
alias cl='clear && ll'
alias cs='clear && ls'
alias ca='clear && la'
alias df='df -h'
alias mv='mv -i'
alias cp='cp -i'
alias psa='ps aux'
alias mkd='mkdir'
alias rmd='rmdir'
# Useful
alias sudo='sudo -E'
alias bk='cd $OLDPWD'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias dp='cd ~/Desktop/'
alias mnt='cd /media/$USER/'
alias umnt='sudo umount'
alias fn='cat /dev/null > '
alias fc='ls -F |grep -v / |wc -l'
alias untar='tar -zxvf'
alias ts='sudo timedatectl set-timezone Asia/Tokyo && sudo ntpdate -v ntp.jst.mfeed.ad.jp'
alias tsnict='sudo timedatectl set-timezone Asia/Tokyo && sudo ntpdate -v ntp.nict.jp'
alias cm='sudo sh -c "echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a"'

# Func
function wether() {
	curl -H "Accept-Language: ja" wttr.in/$1
}

function wetheren() {
	curl -H "Accept-Language: en" wttr.in/$1
}

function mkdd() {
	mkdir $1 ; cd $_
}

function pss() {
	ps aux | grep -E "PID|$1" | grep -v grep
}

function sc() {
	grep -E $1 -rl $2
}

# Path
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval $(thefuck --alias)

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.cargo/env"

# fnm
export PATH=/home/fushi/.fnm:$PATH
eval "`fnm env`"

__fnm_use_if_file_found() {
    if [[ -f .node-version || -f .nvmrc ]]; then
        fnm use
    fi
}

__fnmcd() {
    \cd "$@" || return $?
    __fnm_use_if_file_found
}

alias cd=__fnmcd
__fnm_use_if_file_found

