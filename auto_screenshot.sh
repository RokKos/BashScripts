#! /bin/bash
# Script for taking screenshots

c=0
while true;
do

	#scrot -d 5 '%Y-%m-%d-%H:%M:%S.png' -e 'mv $f ~/Pictures/';
	scrot -d 1 "DSC_$(printf "%05d" $c).jpg" -e 'mv $f ~/Pictures/';
	((c++))
done