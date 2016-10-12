#! /bin/bash
# Command that list all files that match regural expresion
# Usage: sh lsFind '\<[M,o]' -> find all files that starts on M and o
# Documentation for regex expretions https://www.gnu.org/software/findutils/manual/html_node/find_html/egrep-regular-expression-syntax.html
ls -la | egrep $1