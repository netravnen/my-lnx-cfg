if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/bin/xlogin" ] ; then
  PATH="$HOME/bin/xlogin:$PATH"
fi

# PS1
_date="\D{%Y-%m-%d}"
_time="\t"
_username="\u"
_hostname="\H"
_currentdir="\w"
_shell="$(echo $SHELL | awk -F'/' '{print $3}') $(echo $KSH_VERSION | sed -n 's/.*\(v[0-9.]*\).*/\1/p')"
_os=$(uname -s)
_arch=$(uname -m)
_ver=$(uname -r)
BLUE='\[\033[0;34m\]'
DARK_BLUE='\[\033[1;34m\]'
RED='\[\e[0;31m\]'
DARK_RED='\[\033[1;31m\]'
BROWN='\[\e[0;33m\]'
NO_COLOR='\[\e[m\]'
export PS1="\n$BROWN{{ $_date $_time }} {{ $_shell }} {{ $_os $_arch $_ver }}\n\
$_username@$NO_COLOR$RED$_hostname$NO_COLOR $BROWN$_currentdir >$NO_COLOR "

