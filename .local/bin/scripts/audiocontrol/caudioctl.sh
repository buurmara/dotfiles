#!/bin/bash

if [[ $1 == "incr" ]]; then

    if [[ $2 == "all" ]]; then

        if [[ $3 != "" ]]; then

            for SINK in `pacmd list-sinks | grep 'index:' | cut -b12-`; do

                 pactl set-sink-volume $SINK "+$3%"

            done
        else
            echo "Specify the value"; exit -10

        fi

    else
      echo "ERROR Not implemented yet."; exit -1

    fi

elif [[ $1 == "decr" ]]; then

    if [[ $2 == "all" ]]; then

        if [[ $3 != "" ]]; then

            for SINK in `pacmd list-sinks | grep 'index:' | cut -b12-`; do

                pactl set-sink-volume $SINK "-$3%"

            done
        else
            echo "Specify the value"; exit -10

        fi

     else
      echo "ERROR Not implemented yet."; exit -1

   fi

elif [[ $1 == "set" ]]; then

    if [[ $2 == "all" ]]; then

        if [[ $3 != "" ]]; then

            for SINK in `pacmd list-sinks | grep 'index:' | cut -b12-`; do

                pactl set-sink-volume $SINK "$3%"

            done
        else
            echo "Specify the value"; exit -10

        fi

      else
      echo "ERROR Not implemented yet."; exit -1

  fi

    else
      echo "ERROR Not implemented yet."; exit -1

fi
