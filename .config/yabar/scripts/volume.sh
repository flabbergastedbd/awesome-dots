echo "  " $(amixer get Master | grep -oE "\[([0-9]{2,3})%\]" | head -n 1 | tr -d "%[]" )
