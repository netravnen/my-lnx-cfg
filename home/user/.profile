# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# $SHELL = BASH
if [ -n "$BASH_VERSION" ] ; then
  if [ -f "$HOME/.bashrc" ] ; then
    . "$HOME/.bashrc"
  fi
fi

# $SHELL = KSH
if [ -n "$KSH_VERSION" ] ; then
  if [ -f "$HOME/.kshrc" ] ; then
    . "$HOME/.kshrc"
  fi
fi

#if [[ $(echo $HOSTNAME) == 'ny-sm2' ]] ; then
#  `echo $- | grep -qs i` && byobu-launcher && exit 0
#fi

export TERM=vt100

# Append the following line to your shell startup file (bash/ksh/zsh only):
# Value to closed a ssh connection after x seconds of idle activity
if [ -n "$BASH_VERSION" ] || [ -n "$KSH_VERSION" ] || [ -n "$ZSH_VERSION" ] ; then
  TMOUT=3600
fi

export HOSTALIASES=~/.hosts
