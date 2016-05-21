#! /bin/bash
#Script for compiling ande executing c++ programs with input

BR='\x1b[31;1m'  # bold red
BG='\x1b[32;1m'  # bold green
NC='\x1b[37;0m'  # no color
BB='\x1b[34;1m'

function error { >&2 echo -e "${BR}$1${NC}"; }
function showinfo { echo -e "${BG}$1${NC}"; }

#Get file name
fl=$(echo $1|sed 's/\(.*\)\.cpp/\1/')

showinfo "Compiling program $1 and making output $fl"
g++ $1 -Wall -O2 -o $fl

if [ $? -eq 0 ];
then
    if [ -e $fl.in ];
    then
        showinfo "Runing $fl with input file $fl.in"
        ./$fl < $fl.in > $fl.out
        showinfo "Create output file $fl.out"
    else
        error "No input file $fl.in"
        showinfo "Runing $fl"
        ./$fl > $fl.out
       showinfo "Created output file $fl.out"
    fi
    showinfo "Printing $fl.out"
    cat $fl.out
fi
