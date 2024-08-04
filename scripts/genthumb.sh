#!/bin/bin/env bash

FILE=$1
TIMECODE=$2

file=$(basename "$f")
filename="${file%.*}"

mkdir -p thumbnails

ffmpeg -ss $TIMECODE -i $FILE -frames:v 1 thumbnails/$filename-thumbnail.jpg
ffmpeg -ss $TIMECODE -i $FILE -frames:v 1 thumbnails/$filename-thumbnail.png
