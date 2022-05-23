#!/bin/bash

# toggle between asusctl fan profiles and send a notification each time
# probably also unnecessary but its useful to see the fan profile (i guess?) lol

asusctl profile -n

current_profile=$(echo -e $(asusctl profile -p) | awk '{print $4}')
quiet_icon=~/.extras/icons/quiet.svg
balanced_icon=~/.extras/icons/balanced.svg
performance_icon=~/.extras/icons/turbo.svg

# the 'x-canonical-private-synchronous' i got from the arch wiki idk how it works lol
# https://wiki.archlinux.org/title/Desktop_notifications#Replace_previous_notification

case $current_profile in

	Quiet)
	  notify-send -h string:x-canonical-private-synchronous:asusctl 'Fan profile' 'Quiet' -i $quiet_icon 
	  ;;
	  
	Balanced)
	  notify-send -h string:x-canonical-private-synchronous:asusctl 'Fan profile' 'Balanced' -i $balanced_icon 
	  ;;
	
	Performance)
	  notify-send -h string:x-canonical-private-synchronous:asusctl 'Fan profile' 'Performance' -i $performance_icon 
	  ;;
esac
