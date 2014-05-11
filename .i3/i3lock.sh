#!/bin/bash
scrot /tmp/screen_locked.png
convert /tmp/screen_locked.png -blur 2x2 /tmp/screen_locked2.png
i3lock -i /tmp/screen_locked2.png
