#!/bin/bash

# Check pre-required tools
if ! which expect > /dev/null; then # required by su_cmd
    echo "Install 'expect' command first"
    exit 1
fi

export SYSCON_ROOT=$(dirname $(readlink -f $0))
export SYSCON_BIN="$SYSCON_ROOT/bin"
export SYSCON_RECIPE="$SYSCON_ROOT/recipe"
export SYSCON_INCLUDE="$SYSCON_ROOT/include"
export SYSCON_USER=$USER
export SYSCON_TARGET=OK.$(hostname -s)
export SYSCON_PREFIX=${HOME}/$(hostname -s)/usr

export SU_CMD=$SYSCON_BIN/su_cmd
export FINISH="if [ \$\$UID = \"0\" ]; then su $SYSCON_USER -c \"touch $SYSCON_TARGET\"; else touch $SYSCON_TARGET; fi;"

recipes=(`ls $SYSCON_ROOT/recipe`)

if [ ${#recipes[*]} -eq 0 ]; then
    echo "No recipe."
    exit 1
fi

idx=0
default_idx=
echo "== Recipes =="
for recipe in $recipes; do
    echo "$idx: $recipe"
    if [ "$recipe" = $(hostname -s) ]; then
	default_idx=$idx
    fi
    idx=$((idx+1))
done
echo
selected_idx=
while [ -z "$selected_idx" ]; do
    echo -n "Type number to select recipe"
    if ! [ -z "$default_idx" ]; then
	echo -n " [default: $default_idx]"
    fi
    echo -n "> "
    read input
    if [ "$input" -lt ${#recipes[*]} ]; then
	selected_idx=$input
    else
	echo "Invalid input: $input"
    fi
done
selected_recipe=${recipes[$selected_idx]}
echo "$selected_recipe selected."

if [ -z "$SU_PASSWORD" ]; then
    echo -n "root password: "
    trap "stty echo" 0
    stty -echo
    read input
    export SU_PASSWORD=$input
    stty echo
fi

recipe_dir="$SYSCON_RECIPE/$selected_recipe"
case "$1" in
    clean)
	make -C $recipe_dir clean
	;;
    *)
	make -C $recipe_dir
	;;
esac