#!/bin/bash
ACTION=$1
DEVICE=1
declare -i CURVOL=`cat ~/.volume` #Reads in the current volume
if [[ $ACTION == "reset" ]]; then
  CURVOL=30000
  echo $CURVOL > ~/.volume
  echo 0 > ~/.mute
  pactl set-sink-mute $DEVICE 0
  pactl set-sink-volume $DEVICE $CURVOL
fi

if [[ $ACTION == "increase" ]]; then
  pactl set-sink-mute $DEVICE 0
  echo 0 > ~/.mute
  CURVOL=$(($CURVOL + 3000))
fi
if [[ $ACTION == "decrease" ]]; then
  CURVOL=$(($CURVOL - 3000))
fi

if [[ $CURVOL -le 90000 && $CURVOL -ge 0 ]]; then 
  pactl set-sink-volume $DEVICE $CURVOL
  echo $CURVOL > ~/.volume # Write the new volume to disk to be read the next time the script is run.
fi

if [[ $ACTION == "toggle" ]]; then
  if [[ `cat ~/.mute` -eq 1 ]]; then
    ACTION=unmute
  else
    ACTION=mute
  fi
fi

if [[ $ACTION == "mute" ]]; then
  pactl set-sink-mute $DEVICE 1
  echo 1 > ~/.mute
fi

if [[ $ACTION == "unmute" ]]; then
  pactl set-sink-mute $DEVICE 0

echo 0 > ~/.mute
fi
