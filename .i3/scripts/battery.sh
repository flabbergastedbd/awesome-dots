#!/bin/bash
#
# Dependencies: acpi, font-awesome
#
# A battery status monitor built for i3blocks initially
#
# Copyright © 2016 Bharadwaj Machiraju <tunnelshade at gmail dot com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


BAT_N=0

OUT=$(acpi -b | grep "Battery $BAT_N")

BAT_S=$(echo $OUT | awk '{ print $3 }' | grep -o '[a-zA-Z]*')
BAT_P=$(echo $OUT | awk '{ print $4 }' | grep -o '[0-9]*')
BAT_R=$(echo $OUT | awk '{ print $5 }' | cut -d ':' -f 1,2)

if [[ $BAT_S == "Discharging" ]]; then
	if [[ $BAT_P -ge 80 ]]; then
		printf "<span color='#005900'>"
	elif [[ $BAT_P -ge 60 ]]; then
		printf "<span color='#A8FF00'>"
	elif [[ $BAT_P -ge 40 ]]; then
		printf "<span color='#FFF600'>"
	elif [[ $BAT_P -ge 20 ]]; then
		printf "<span color='#FFAE00'>"
	else
		printf "<span color='#FF0000'>"
	fi
else
	printf "<span color='#005900'>"
fi

printf "  $BAT_P%% ($BAT_R)"
printf "</span>"

if [[ $BAT_P -lt 5 ]]; then
	exit 33
fi
