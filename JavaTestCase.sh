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

error() { >&2 echo "${RED}$1${NC}"; }
showinfo() { echo "${BG}$1${NC}"; }
workingprocess() { echo "${BB}$1${NC}"; }
allert () { echo "${RED}$1${NC}"; }

#Get file name
fl=$(echo $1|sed 's/\(.*\)\.java/\1/')

showinfo "Compiling program $1 and making output $fl"
javac $1 

FILESINPUT="$2vhod*.txt" #get all files with vhod name from folder
FILESOUTPUT="$2izhod*.txt" #get all files with izhod name from folder

i=1

for testCase in $FILESINPUT
do
	workingprocess "Runing $fl with input file $testCase"
	outputFile="$2$fl$i.out" #adding together string
    java $fl < $testCase > $outputFile
    showinfo "Create output file $fl$i.out"
	cat $testCase
	cat $outputFile
	i=$((i+1))
done

i=1

for checkCase in $FILESOUTPUT
do
	allert "Checking $fl$i.out with test output file $checkCase"
    outputFile="$2$fl$i.out"
    diff $checkCase $outputFile
    i=$((i+1))
done