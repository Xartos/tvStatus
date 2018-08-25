#!/bin/bash

TV_IP=192.168.1.29
DIR=/usr/local/bin

log() {
  # Generic log function.
  echo $1
}

while [ true ]; do
  sleep 1

  # This is where you put all the commands for the daemon.
  ping -W 1 -c 1 $TV_IP > /dev/null
  tvStatus=$?

  # Save state if first run
  if [ -z "$oldTvStatus" ]; then
    if [ $tvStatus -eq 0 ]; then
      log "First run, setting tv status to on"
    else
      log "First run, setting tv status to off"
    fi

    oldTvStatus=$tvStatus
  fi

  if [ "$tvStatus" -ne "$oldTvStatus" ]; then
    oldTvStatus=$tvStatus
    if [ "$tvStatus" -gt 0 ]; then
      log "Tv is now off, Turning off light"
      # Tv turned off
      $DIR/turn-off-lights.sh
    else
      log "Tv is now on, Turning on light"
      # Tv turned on
      $DIR/turn-on-lights.sh
    fi
  fi
done
