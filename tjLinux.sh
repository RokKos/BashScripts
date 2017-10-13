#! /bin/bash
#Script for compiling and executing Java programs on test cases
#You run this script by giving two arguments
#Name of your java file and destination to test cases
#EXAMPLE:
#sh JavaTestCase.sh <programeName> <testCaseDestination>
#------------------------------------------------------
#sh JavaTestCase.sh HelloWorld.java path/to/folder/

RED='\033[0;31m' #red
BB='\033[0;34m'  # blue
NC='\033[0m' # No Color
BG='\033[0;32m' #green

error() { >&2 echo -e "${RED}$1${NC}"; }
showinfo() { echo -e "${BG}$1${NC}"; }
workingprocess() { echo -e "${BB}$1${NC}"; }
allert () { echo -e "${RED}$1${NC}"; }

#Get file name
fl=$(echo $1|sed 's/\(.*\)\.java/\1/')

showinfo "Compiling program $1 and making output $fl"
javac $1 

FILESINPUT="$2vhod*.txt" #get all files with vhod name from folder
FILESOUTPUT="$2izhod*.txt" #get all files with izhod name from folder

i=1

correct=0

for testCase in $FILESINPUT
do
	printf "$testCase: "
	outputFile="$2$fl$i.out" #adding together string
    java $fl < $testCase > $outputFile
    #showinfo "Create output file $fl$i.out"

	diff "$2izhod$(printf "%02d" $i).txt" $outputFile
	if [ $? == 0 ]; then 
		showinfo "OK"
		correct=$((correct+1))
	else
		allert "WRONG"
	fi

	
	i=$((i+1))
done

echo "Result: $correct / $((i - 1))"
