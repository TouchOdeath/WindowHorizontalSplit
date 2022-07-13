#!/bin/bash
function UnMaximizeWin(){
	wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
}
UnMaximizeWin
winid=$(xdotool getwindowfocus)
xdotool windowsize $winid 50% 100%
if [ "$1" == "left" ]; then
    xdotool windowmove $winid 0 0
else
	WIDTH=$(xdpyinfo | awk '/dimensions/{print $2}' | awk -F "x" '{print $1}')
	WIDTH=$(($WIDTH / 2))
	xdotool windowmove $winid $WIDTH 0
fi
