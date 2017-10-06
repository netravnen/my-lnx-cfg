# /bin/sh

# script to kill all dead processes with <defunct> in process name

PID="$(ps aux | grep ztd-log | grep -v grep | awk '{print $2}')"
echo ${PID} 

if [ x"${PID}" != x"" ]; then
	kill -9 ${PID} &>/dev/null
	sleep 1
fi
echo "done"
