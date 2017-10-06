# $HOME/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTCONTROL=ignoreboth
HISTCONTROL=ignorespace
HISTCONTROL=ignoredups
HISTSIZE=25000
HISTFILESIZE=25000
HISTTIMEFORMAT='%F %T '

shopt -s histappend
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -x /usr/bin/dircolors ] ; then
  test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
fi
if [ -f /etc/bash_completion ] && ! shopt -oq posix ; then
  . /etc/bash_completion
fi
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/bin/xlogin" ] ; then
  PATH="$HOME/bin/xlogin:$PATH"
fi

# PS1
if $(echo type hostname) | grep -E "^hostname is /" > /dev/null ; then
  fqn=$(hostname --fqdn)
else
  fqn=$(hostname)
fi
fqn=${fqn##*name = }
#fqn=${fqn%.*}
_date="\D{%Y-%m-%d}"
_time="\t"
_username="\u"
_hostname=$fqn
_currentdir="\w"
_shell="$(echo $SHELL | awk -F'/' '{print $3}') v$(echo $BASH_VERSION | sed -e 's/\-release//')"
_os=$(uname -s)
_arch=$(uname -m)
_ver=$(uname -r)
BLUE='\[\033[0;34m\]'
DARK_BLUE='\[\033[1;34m\]'
RED='\[\e[0;31m\]'
DARK_RED='\[\033[1;31m\]'
BROWN='\[\e[0;33m\]'
NO_COLOR='\[\e[m\]'
export PS1="\n$BROWN{{ $_date $_time }} {{ $_shell }} {{ $_os $_arch $_ver }}$NO_COLOR\n\
$BROWN$_username@$NO_COLOR$RED$_hostname$NO_COLOR $BROWN$_currentdir >$NO_COLOR "

# Add bash aliases.
if [ -f $HOME/.bash_aliases/*.aliases ] ; then
  . $HOME/.bash_aliases/*.aliases
fi

# === NIXCRAFT: Top 20 OpenSSH Server Best Security Practices ===
#10: Use Strong SSH Passwords and Passphrase
genpasswd() {
  local l=$1
  [ "$l" == "" ] && l=20
  tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
