#!/bin/sh
killall -9 mplayer
killall -9 xwinwrap
for (( ; ; ))
do
    echo "LAUNCHING PID"
    xwinwrap -b -fs -sp -fs -nf -ov -- mplayer ~/Pictures/wallpaper/infinity.mp4 -wid WID &  echo $! > infinity.pid
    CurPID=$(<"infinity.pid")
    echo "pid is $CurPID"
    tail -f --pid=$CurPID -f /dev/null
    echo "looping"
done
