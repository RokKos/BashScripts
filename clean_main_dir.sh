#! /bin/bash
# Script for cleaning after training
# DESCRIPTION:
# This moves all weigts and models to

RED='\033[0;31m' #red
BB='\033[0;34m'  # blue
NC='\033[0m' # No Color
BG='\033[0;32m' #green

error() { >&2 echo -e "${RED}$1${NC}"; }
showinfo() { echo -e "${BG}$1${NC}"; }
workingprocess() { echo -e "${BB}$1${NC}"; }
allert () { echo -e "${RED}$1${NC}"; }

# Arrays in bash are generated wen you call command of tipe name[index]=value
showinfo "Getting all directories"
c=0
for directory in ./ModelInfo/*/ ; do
	directories[$c]=$directory
	((c++))
done


workingprocess "Sorting directories"
# Sorting array with function sort
sorted=($(
	for element in "${directories[@]}"
		do
			echo "$element"
		done | sort ))
# Print whole array
echo ${directories[@]}
echo ${sorted[@]}
# Print lengt of directory
length=${#sorted[@]}
echo $length
# Get the last element of array
last_elemet=${sorted[length-1]}
echo $last_elemet
length_of_last_element=${#last_elemet}
# Get last two numbers
last_num=${last_elemet:($length_of_last_element-3):2}
echo $last_num
new_folder="${last_elemet:0:length_of_last_element-3}$(printf "%02d" $((last_num+1)))"
echo $new_folder
showinfo "Creating new folder and moving files"
mkdir $new_folder
# Move all files to new folder
mv *.hdf5 $new_folder
# Copy all model files
cp *.h5 $new_folder
