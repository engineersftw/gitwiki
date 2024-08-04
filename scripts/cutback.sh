#!/bin/bin/env bash

# ffmpeg -i speaker4_2016-05-04_20-40-04-norm_need_to_fix.mp4 -vcodec copy -acodec copy -ss 00:00:00 -t 00:20:00  speaker4.mp4

# Usage: trimvideo.sh <src> 02:01:15 <dst>

ffmpeg -ss 00:00:00 -t $2 -i $1 -vcodec copy -acodec copy $3
