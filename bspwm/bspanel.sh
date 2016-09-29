#!/bin/bash

function statusbar {

    function desk() {
    DESKTOP=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
    case $DESKTOP in
        4)  echo "main"
            ;;
        5)  echo "www"
            ;;
        6)  echo "irc"
            ;;
        7)  echo "seven"
            ;;
        8)  echo "eight"
            ;;
        *)  echo "error"
    esac
    }

    function clock() {
    time=$(date "+%e %b  %l:%M")
    echo $time
    }

    function mem() {
    free=$(free -m | grep buffers | awk '{print $3}' | awk '/[0-9]/')
    echo $free
    }

    function temp() {
    tem=$(acpi -t | grep "Thermal 0" | awk '{print $4}')
    echo $tem
    }

    function sda() {
    dfh=$(dfc | grep "/dev/sda4" | awk '{print $3}')
    echo $dfh
    }

    function weather() {
    weath=$(~/bin/weather.sh $zipcode | tr '[:upper:]' '[:lower:]' | sed 's/://g;s/f//g')
    echo $weath
    }
    
    function ncc() {
#    mus=$(mpc current)
    mus=$(ncmpcpp --now-playing)
    echo $mus
    }
    
    echo "^fg(#8A2F58)bspwm $(desk) ^fg(#AAAAAA) ^fg(#287373) ^fg(#914E89) ram $(mem)M ^fg(#98CBFE) sda $(sda) ^fg(#AAAAAA) ^fg(#2B7694) link $(link) ^fg(#AAAAAA) ^fg(#5E468C) $(weather) ^fg(#AAAAAA) ^fg(#8A2F58) cpu $(temp) °C ^fg(#AAAAAA) ^fg(#E5B0FF) now playing: $(ncc) ^fg(#395573) ^fg(#AAAAAA) //  ^fg(#FFFFFF) $(clock) ^fg(#AAAAAA)           "
}
 while true 
 do
     echo "$(statusbar)"
    sleep 2   

 done | dzen2 -bg '#262626' -fn 'pragmata-8-' -h 40 -ta r -p -xs 2 -dock &