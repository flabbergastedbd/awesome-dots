echo "  " $(LC_ALL="en_US.UTF-8" mpstat -P ALL | awk '/ [0-9][0-9]? /{ printf " %02.0f" , 100-$13 }')
