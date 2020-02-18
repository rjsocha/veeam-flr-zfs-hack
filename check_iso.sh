#!/bin/bash

if [[ -f hvproxy.iso ]]
then
	check=$(sha256sum hvproxy.iso)
	check=${check%% *}
	echo "ISO checksum: $check"
	sup=0
	ver=""
	tested=1
	case $check in
		4fcecbb22c3279bd53212dd735bc8dc06bd840d20ac1771a643ad230314518bc)
				sup=1;
				ver="9.5.4.2866"
				;;
		e6227fc489298a67c080c7b2163d7ffc02cc531b7a4a85ec8ff15d48da25fabe)
			tested=0
			ver="9.5.0.1038"
			sup=1
			;;
	esac
	if [[ $sup -eq 1 ]]
	then
		if [[ $tested -eq 1 ]]
		then
			echo "Supported ISO version: $ver"
		else
			echo "Know ISO version: $ver but not TESTED!"
		fi
	else
		echo "Unsupported/unknow ISO version. You can still try but you are on your own :)"
	fi
else
	echo "Unable to continue! - missing hvproxy.iso"
	exit 1
fi
