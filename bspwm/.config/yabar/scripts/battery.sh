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

BAT_N=$(acpi -b | wc -l)

for i in `seq 0 $(expr $BAT_N - 1)`; do
	BAT_N=$i

	if [[ $i -ge 1 ]]; then
		printf " "  # Two space after because it is follwed by unicode
	fi

	OUT=$(acpi -b | grep "Battery $BAT_N")

	BAT_S=$(echo $OUT | awk '{ print $3 }' | grep -o '[a-zA-Z]*')
	BAT_P=$(echo $OUT | awk '{ print $4 }' | grep -o '[0-9]*')
	BAT_R=$(echo $OUT | awk '{ print $5 }' | cut -d ':' -f 1,2)

	if [[ $BAT_S == "Charging" ]]; then
		# printf "<span color='#005900'>"
		printf ""
	else
		if [[ $BAT_P -ge 80 ]]; then
			# printf "<span color='#005900'>"
			printf ""
		elif [[ $BAT_P -ge 60 ]]; then
			# printf "<span color='#A8FF00'>"
			printf ""
		elif [[ $BAT_P -ge 40 ]]; then
			# printf "<span color='#FFF600'>"
			printf ""
		elif [[ $BAT_P -ge 20 ]]; then
			# printf "<span color='#FFAE00'>"
			printf ""
		else
			# printf "<span color='#FF0000'>"
			printf ""
		fi
	fi

	if [[ $BAT_R ]]; then
		printf "  $BAT_P%% "
		printf "($BAT_R)"
	fi
	# printf "</span>"
done

if [[ $BAT_P -lt 5 ]]; then
	exit 33
fi
