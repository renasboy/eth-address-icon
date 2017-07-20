#!/bin/bash

usage () {
    echo "Usage $0 ADDRESS"
    exit 1
}

[[ -n "$1" && -n "$(echo $1 | egrep "0x[0-9a-f]{40}")" ]] || usage


address=$1

hex_address=$(echo $address | tr x 0)

hex_list=($(echo $hex_address | fold -w 6))

fill=""
old_point_x=0
old_point_y=0
for hex in "${hex_list[@]}"; do
    point_list=($(echo $hex | fold -w 2))
    for point in  "${point_list[@]}"; do 
	char_list=($(echo $point | fold -w 1))
	point_x=${char_list[0]}
	point_y=${char_list[1]}
	old_point="$old_point_x,$old_point_y"

	new_point="$old_point_x,$((16#0$point_y))"
	cmd="-fill \#$hex -draw 'line $old_point $new_point' -rotate 90"
	fill="$fill $(echo $_{1..4}"$cmd")"
	old_point=$new_point

	new_point="$((16#0$point_x)),$((16#0$point_y))"
	cmd="-fill \#$hex -draw 'line $old_point $new_point' -rotate 90"
	fill="$fill $(echo $_{1..4}"$cmd")"
	old_point=$new_point

	old_point_x=$((16#0$point_x))
	old_point_y=$((16#0$point_y))
    done
done

mkdir -p icons
cmd="convert -size 16x16 xc:white $fill -scale 128x128 icons/$address.gif"

eval "$cmd"
