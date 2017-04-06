#! /bin/bash
# Script for compiling and displaying PDF

# Compile
pdflatex -shell-escape $1".tex"
# Open
evince $1".pdf" 
# Remove unecesary stuff
rm $1".aux" $1".log" $1".out"