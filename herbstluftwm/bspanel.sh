#!/bin/bash

function statusbar {

    function desk() {
    DESKTOP=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
    case $DESKTOP in
        4)  echo "1"
            ;;
        5)  echo "2"
            ;;
        6)  echo "3"
            ;;
        7)  echo "4"
            ;;
        8)  echo "5"
            ;;
        *)  echo "++"
    esac
    }

    function clock() {
    time=$(date "+%e %b  %l:%M")
    echo $time
    }

    function link() {
    #AP=$(iwconfig wlan0 | grep "Quality" | awk '/Quality/ {print $2}' | sed 's/Quality//g;s/=//g')
    AP=$(ip route get 8.8.8.8 | awk 'NR==2 {print $1}' RS="dev")
    #AP=$(find /proc/irq/ -name \*eth0\* | fgrep -q eth0 && echo up || echo down)
    echo $AP
    }

    function mem() {
    free=$(free -m | awk '{print $3}' | awk '/[0-9]/' | head -1)
    #free=$(free -m | grep buffers | awk '{print $3}' | awk '/[0-9]/')
    echo $free
    }

    function temp() {
    tem=$(acpi -t | grep "Thermal 0" | awk '{print $4}')
    echo $tem
    }

    function sda() {
    dfh=$(dfc | grep "/dev/sda2" | awk '{print $3}')
    echo $dfh
    }

    function weather() {
    weath=$(~/bin/weather.sh $zip | tr '[:upper:]' '[:lower:]' | sed 's/://g;s/f//g')
    echo $weath
    }
    
    function ncc() {
    mus=$(mpc -f %title% current)
    echo $mus
    }
    # line it up
    echo "^fg(#8A2F58)herbstluftwm $(desk) ^fg(#914E89) ram $(mem)M ^fg(#98CBFE) sda $(sda) ^fg(#2B7694) link $(link) ^fg(#5E468C) $(weather) ^fg(#8A2F58) cpu $(temp) °C ^fg(#E5B0FF) now playing: $(ncc) ^fg(#395573) ^fg(#AAAAAA) //  ^fg(#FFFFFF) $(clock)            " 
}

 while true 
 do
     echo "$(statusbar)"
    sleep 50   

 done | dzen2 -bg '#202020' -fn 'pragmata-8-' -h 40 -ta r -p -xs 2 -dock &
