#!/bin/bash
HDMI_FILE="/sys/class/drm/card0-HDMI-A-2/status"
EXTERNAL_OUTPUT="HDMI-2"
INTERNAL_OUTPUT="eDP-1"

function mirror {
 HDMI_STATUS=$(cat $HDMI_FILE)
 if [[ $HDMI_STATUS == "connected" ]]
 then
# xrandr --output HDMI-2 --mode 1920x1200 --pos 1920x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x120 --rotate normal --output DP-2 --off
xrandr --output HDMI-2 --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output eDP-1 --primary --mode 1920x1080 --pos 1920x120 --rotate normal --output DP-2 --off

 else  sleep .5s; xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
 fi
}


if [[ $(cat $HDMI_FILE) = connected ]];then
    mirror
fi

while inotifywait -q -e modify,create,delete,open,close,close_write,access $HDMI_FILE &> /dev/null;
do
 mirror
done
