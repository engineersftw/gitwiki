#!/bin/sh

# ffmpeg -i speaker4_2016-05-04_20-40-04-norm_need_to_fix.mp4 -vcodec copy -acodec copy -ss 00:00:49 speaker4.mp4

ffmpeg -ss $2 -i $1 -vcodec copy -acodec copy $3
