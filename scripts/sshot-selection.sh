#!/bin/bash

# take screenshot then send confirmation notification
# its like bootleg greenshot or something idk
# probably way too complicated and unnecessary
# also probably only works on wayland

arg=$1
temp_filename=$(date +%s)
icon=~/.extras/icons/clipboard.svg
c_icon=~/.extras/icons/exit.svg

# fullscreen screenshot
if [[ $arg == '-f' ]]
then
	grim - | wl-copy && notify-send -i $icon 'Fullscreen screenshot has been saved to your clipboard.' &
	

# selection screenshot
elif [[ $arg == '-s' ]]
then
	# idk how to do this other than just saving it and then deleting it sorry
	grim -g "$(slurp)" /tmp/$temp_filename.png
	if [[ $? == 0 ]]
	then
		wl-copy < /tmp/$temp_filename.png && notify-send -i $icon 'Screenshot selection has been saved to your clipboard.' &
		rm /tmp/$temp_filename.png
		
	elif [[ $? == 1 ]]
	then
		notify-send -i $c_icon 'Screenshot capture canceled.' &
	fi

# help options
else
	echo -e 'Usage:'
	echo -e '  -s: Selection screenshot'
	echo -e '  -f: Fullscreen screenshot'
fi
		
			
