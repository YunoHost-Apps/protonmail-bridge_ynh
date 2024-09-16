#!/bin/bash

case "$1" in
  start)
    # will create a screen in detached mode (background) with name "protonmail"
    screen -S protonmail -dm ./bridge --cli
    echo "Service started."
    ;;
  status)
    # ignore this block unless you understand how screen works and that only lists the current user's screens
    result=$(screen -list | grep protonmail)
    if [ $? == 0 ]; then
      echo "Protonmail bridge service is ON."
    else
      echo "Protonmail bridge service is OFF."
    fi
    ;;
  stop)
    # Will quit a screen called "protonmail" and therefore terminate the running protonmail-bridge process
    screen -S protonmail -X quit
    echo "Service stopped."
    ;;
  *)
    echo "Unknown command: $1"
    exit 1
  ;;
esac
