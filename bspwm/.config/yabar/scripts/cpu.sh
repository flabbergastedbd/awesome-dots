echo "  " $(LC_ALL="en_US.UTF-8" mpstat -P ALL | tail -n 4 | awk '{ printf " %02.0f" , 100-$13 }')
