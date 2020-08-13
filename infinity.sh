#!/bin/sh
killall -9 mplayer
killall -9 xwinwrap
for (( ; ; ))
do
    echo "LAUNCHING PID"
    xwinwrap -b -ov -nf -s -ni -g 1920x1080+0+0  -- mplayer ~/Pictures/wallpaper/infinity.mp4 -loop 0 -wid WID & echo $! > infinity.pid
    xwinwrap -b -ov -nf -s -ni -g 1920x1080+1920+0  -- mplayer ~/Pictures/wallpaper/infinity.mp4 -loop 0 -nosound -wid WID &  echo $! > infinity2.pid
    CurPID=$(<"infinity.pid")
    echo "pid is $CurPID"
    tail -f --pid=$CurPID -f /dev/null
    echo "looping"
done
