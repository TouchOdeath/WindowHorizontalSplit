#!/bin/bash
function UnMaximizeWin(){
	wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
}
#un-maximize window in order to resize and move window
UnMaximizeWin
winid=$(xdotool getwindowfocus)
xdotool windowsize $winid 50% 100%
WIDTH=0 #left is default
if [ "$1" == "right" ]; then
    WIDTH=$(xdpyinfo | awk '/dimensions/{print $2}' | awk -F "x" '{print $1}')
    WIDTH=$(($WIDTH / 2))
fi
xdotool windowmove $winid $WIDTH 0
