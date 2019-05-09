#!/bin/bash

case $1 in
	shutdown)
		systemctl poweroff
		;;
	reboot)
		systemctl reboot
		;;
	lock)
		sxlock
		;;
esac
