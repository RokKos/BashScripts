#! /bin/bash
# Script that outputs beautifull graph of commits
# From Author: Tim Green, link: https://github.com/tiimgreen/github-cheat-sheet

git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative