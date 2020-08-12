#!/bin/sh
killall -9 mplayer
killall -9 xwinwrap
for (( ; ; ))
do
    echo "LAUNCHING PID"
    xwinwrap -b -fs -sp -fs -nf -ov -- mplayer ~/Pictures/wallpaper/videoplayback -wid WID &  echo $! > borg.pid;
    CurPID=$(<"borg.pid")
    echo "pid is $CurPID"
    tail -f --pid=$CurPID -f /dev/null
    echo "looping"
done
