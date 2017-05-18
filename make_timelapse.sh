#! /bin/bash
# Script for making time lapse

# Explanation of code is here: https://gist.github.com/croqaz/16c7fcde52c570844582a99467ae599b
ffmpeg -r 10 -pattern_type glob -i '*.jpg' -i DSC_%2d.jpg -s hd1080 -vcodec libx264 -pix_fmt yuv420p timelapse.mp4