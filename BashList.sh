#! /bin/bash
#Script that outputs all bash scripts and write them in file

#Save file path
file_path=${PWD}
output_file_name=$file_path"/bashlist.out"
 

#Count all files $file_path/*.sh
countFiles=$(ls $file_path/*.sh -l | wc -l)

#if file exist create empty file
if [ -e $output_file_name ]
then
	printf "" > $output_file_name
fi

#add nuber on top of file
echo "Number of scripts $countFiles" >> $output_file_name

#Loop throught all bash scripts in file_path
for file in $file_path/*.sh
do
	echo ${file##*/} >> $output_file_name 
done
#Print bashlist.out
cat $output_file_name